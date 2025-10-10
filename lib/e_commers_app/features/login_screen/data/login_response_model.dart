class LoginModelResponse {
  /*
  {
  "accessToken": "string",
  "expiresAtUtc": "2025-10-10T11:23:51.271Z",
  "refreshToken": "string"
}
   */
  final String accessToken;
  final String expiresAtUtc;
  final String refreshToken;

  LoginModelResponse({
    required this.accessToken,
    required this.expiresAtUtc,
    required this.refreshToken,
  });

  factory LoginModelResponse.fromJson(Map<String, dynamic> json) {
    return LoginModelResponse(
      accessToken: json['accessToken'],
      expiresAtUtc: json['expiresAtUtc'],
      refreshToken: json['refreshToken'],
    );
  }
}
