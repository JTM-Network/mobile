import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jtm/core/domain/account.dart';
import 'package:jtm/core/domain/auth.dart';
import 'package:jtm/core/domain/http.dart';
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
        .then((value) {
      if (value.statusCode != 200) {
        Map errorMap = jsonDecode(value.body);
        var error = HttpError.fromJson(errorMap);
        throw new Exception(error.status.toString() + ": " + error.message);
      }

      Map tokenPairMap = jsonDecode(value.body);
      var tokenPair = TokenPair.fromJson(tokenPairMap);

      return storage.write(key: 'refresh_token', value: tokenPair.refreshToken);
    });
  }

  Future<bool> register(String username, String email, String password) {}

  Future<Account> getAccount() {}

  Future<bool> isAdmin() {}

  Future<bool> isClient() {}

  Future<String> refreshAccess() {}

  AuthService._internal();
}
