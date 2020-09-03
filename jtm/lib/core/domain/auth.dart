class LoginRequest {

  final String email;
  final String password;

  LoginRequest(this.email, this.password);

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };
}

class RegisterRequest {
  final String username;
  final String email;
  final String password;

  RegisterRequest(this.username, this.email, this.password);

  Map<String, dynamic> toJson() => {
    'username': username,
    'email': email,
    'password': password,
  };
}