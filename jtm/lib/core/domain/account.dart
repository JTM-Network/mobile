
class Account {
  String username;
  String email;
  List<String> roles;

  Account.fromJson(Map<String, dynamic> json)
        : username = json['username'],
          email = json['email'],
          roles = List<String>.from(json['roles']);
}