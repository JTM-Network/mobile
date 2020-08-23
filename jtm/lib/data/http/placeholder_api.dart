import 'package:http/http.dart' as http;

class PlaceholderApi {
  
  Future<http.Response> post(String url, dynamic object) async {
    return await http.post(url, headers: headers(), body: object);
  }

  Future<http.Response> put(String url, dynamic object) async {
    return await http.put(url, headers: headers(), body: object);
  }

  Future<http.Response> fetch(String url) async {
    return await http.get(url, headers: headers());
  }

  Future<http.Response> delete(String url) async {
    return await http.delete(url, headers: headers());
  }

  Map<String, String> headers() {
    return {
      'Content-Type': 'application/json'
    };
  }
}
