import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jtm/core/domain/account.dart';
import 'package:jtm/core/domain/auth.dart';
import 'package:jtm/core/domain/token_pair.dart';
import 'package:jtm/core/usecase/http/jtm_api.dart';

class AuthService {
  static final AuthService _authService = AuthService._internal();
  final FlutterSecureStorage storage = FlutterSecureStorage();
  final JtmApi api = JtmApi();

  factory AuthService() {
    return _authService;
  }

  Future<void> login(String email, String password) async {
    return await api
        .post('/account/auth/login', json.encode(LoginRequest(email, password).toJson()))
        .then((value) async {
      Map tokenPairMap = jsonDecode(value.body);
      var tokenPair = TokenPair.fromJson(tokenPairMap);

      await storage.write(key: 'access_token', value: tokenPair.accessToken);
      return await storage.write(key: 'refresh_token', value: tokenPair.refreshToken);
    });
  }

  Future<bool> register(String username, String email, String password) async {
    return await api.post('/account/account/register', json.encode(RegisterRequest(username, email, password).toJson()))
            .then((value) {
              return Future.value(value.statusCode != 200 ? false : true);
            });
  }

  Future<void> logout() async {
    await storage.delete(key: 'access_token');
    return await storage.delete(key: 'refresh_token');
  }

  Future<Account> getAccount() async {
    return await api.fetchWithAuth('/account/auth/me')
                    .then((value) {
                      Map accountMap = jsonDecode(value.body);
                      var account = Account.fromJson(accountMap);
                      return account;
                    });
  }

  Future<bool> isAdmin() async {
    return await getAccount()
              .then((value) => value.roles.contains('ROLE_ADMIN') ? true : false);
  }

  Future<bool> isClient() async {
    return await getAccount()
                .then((value) => value.roles.contains('ROLE_CLIENT') ? true : false);
  }

  Future<void> refreshAccess(BuildContext context) async {
    return await api.refresh()
                      .then((value) {
                        print("Refreshed...");
                        return storage.write(key: 'access_token', value: value.body);
                      });
  }

  AuthService._internal();
}
