class SignInReq {
  String email;
  String password;
  SignInReq({required this.email, required this.password});
  factory SignInReq.fromJson(Map<String, dynamic> json) {
    return SignInReq(email: json["email"], password: json["password"]);
  }
  Map<String, dynamic> toJson() {
    return {"email": email, "password": password};
  }
}
