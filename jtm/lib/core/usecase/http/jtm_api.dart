import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jtm/core/domain/http.dart';

class JtmApi {
  String baseUrl = "http://api.jtm-network.com";

  Future<http.Response> post(String url, dynamic object) async {
    return await http
        .post(baseUrl + url, headers: headers(), body: object)
        .then((value) {
      if (value.statusCode != 200) {
        Map errorMap = jsonDecode(value.body);
        var error = HttpError.fromJson(errorMap);
        throw new Exception(error.status.toString() + ": " + error.message);
      }
      return value;
    });
  }

  Future<http.Response> postWithAuth(String url, dynamic object) async {
    Map<String, String> authHeader = await authHeaders();

    return await http
        .post(baseUrl + url, headers: authHeader, body: object)
        .then((value) {
      if (value.statusCode != 200) {
        Map errorMap = jsonDecode(value.body);
        var error = HttpError.fromJson(errorMap);
        throw new Exception(error.status.toString() + ": " + error.message);
      }
      return value;
    });
  }

  Future<http.Response> put(String url, dynamic object) async {
    return await http
        .put(baseUrl + url, headers: headers(), body: object)
        .then((value) {
      if (value.statusCode != 200) {
        Map errorMap = jsonDecode(value.body);
        var error = HttpError.fromJson(errorMap);
        throw new Exception(error.status.toString() + ": " + error.message);
      }
      return value;
    });
  }

  Future<http.Response> putWithAuth(String url, dynamic object) async {
    Map<String, String> authHeader = await authHeaders();

    return await http
        .put(baseUrl + url, headers: authHeader, body: object)
        .then((value) {
      if (value.statusCode != 200) {
        Map errorMap = jsonDecode(value.body);
        var error = HttpError.fromJson(errorMap);
        throw new Exception(error.status.toString() + ": " + error.message);
      }
      return value;
    });
  }

  Future<http.Response> fetch(String url) async {
    return await http
        .get(baseUrl + baseUrl + url, headers: headers())
        .then((value) {
      if (value.statusCode != 200) {
        Map errorMap = jsonDecode(value.body);
        var error = HttpError.fromJson(errorMap);
        throw new Exception(error.status.toString() + ": " + error.message);
      }
      return value;
    });
  }

  Future<http.Response> fetchWithAuth(String url) async {
    Map<String, String> authHeader = await authHeaders();

    return await http.get(baseUrl + url, headers: authHeader).then((value) {
      if (value.statusCode != 200) {
        Map errorMap = jsonDecode(value.body);
        var error = HttpError.fromJson(errorMap);
        throw new Exception(error.status.toString() + ": " + error.message);
      }
      return value;
    });
  }

  Future<http.Response> delete(String url) async {
    return await http.delete(baseUrl + url, headers: headers()).then((value) {
      if (value.statusCode != 200) {
        Map errorMap = jsonDecode(value.body);
        var error = HttpError.fromJson(errorMap);
        throw new Exception(error.status.toString() + ": " + error.message);
      }
      return value;
    });
  }

  Future<http.Response> deleteWithAuth(String url) async {
    Map<String, String> authHeader = await authHeaders();

    return await http.delete(baseUrl + url, headers: authHeader).then((value) {
      if (value.statusCode != 200) {
        Map errorMap = jsonDecode(value.body);
        var error = HttpError.fromJson(errorMap);
        throw new Exception(error.status.toString() + ": " + error.message);
      }
      return value;
    });
  }

  Future<http.Response> refresh() async {
    Map<String, String> header = await refreshHeaders();

    return await http.get(baseUrl + '/account/auth/refresh', headers: header).then((value) {
      if (value.statusCode != 200) {
        Map errorMap = jsonDecode(value.body);
        var error = HttpError.fromJson(errorMap);
        throw new Exception(error.status.toString() + ": " + error.message);
      }
      return value;
    });
  }

  Map<String, String> headers() {
    return {'Content-Type': 'application/json'};
  }

  Future<Map<String, String>> authHeaders() async {
    final storage = FlutterSecureStorage();
    String token = await storage.read(key: 'access_token');
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }

  Future<Map<String, String>> refreshHeaders() async {
    final storage = FlutterSecureStorage();
    String token = await storage.read(key: 'refresh_token');
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'Api-Type': 'api'
    };
  }
}
