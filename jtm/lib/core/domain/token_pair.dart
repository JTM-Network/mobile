
class TokenPair {
  final String accessToken;
  final String refreshToken;

  TokenPair(this.accessToken, this.refreshToken);

  TokenPair.fromJson(Map<String, dynamic> json)
        : accessToken = json['accessToken'],
          refreshToken = json['refreshToken'];

  Map<String, dynamic> toJson() => {
    'accessToken': accessToken,
    'refreshToken': refreshToken,
  };
}