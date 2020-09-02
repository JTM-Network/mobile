import 'dart:convert';

import 'package:http/http.dart' as http;

class JtmApi {

  String baseUrl = "http://api.jtm-network.com";

  Future<http.Response> post(String url, dynamic object) async {
    return await http.post(baseUrl + url, headers: headers(), body: object);
  }

  Future<http.Response> postWithAuth(String url, dynamic object, String token) async {
    return await http.post(baseUrl + url, headers: authHeaders(token), body: object);
  }

  Future<http.Response> put(String url, dynamic object) async {
    return await http.put(baseUrl + url, headers: headers(), body: object);
  }

  Future<http.Response> putWithAuth(String url, dynamic object, String token) async {
    return await http.put(baseUrl + url, headers: authHeaders(token), body: object);
  }

  Future<http.Response> fetch(String url) async {
    return await http.get(baseUrl + baseUrl + url, headers: headers());
  }

  Future<http.Response> fetchWithAuth(String url, String token) async {
    return await http.get(baseUrl + url, headers: authHeaders(token));
  }

  Future<http.Response> delete(String url) async {
    return await http.delete(baseUrl + url, headers: headers());
  }

  Future<http.Response> deleteWithAuth(String url, String token) async {
    return await http.delete(baseUrl + url, headers: authHeaders(token));
  }

  Map<String, String> headers() {
    return {
      'Content-Type': 'application/json'
    };
  }

  Map<String, String> authHeaders(String token) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }
}
