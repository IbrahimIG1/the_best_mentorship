class LoginModelRequest {
  String? email;
  String? password;
  LoginModelRequest({this.email, this.password});
  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}