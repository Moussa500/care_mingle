import 'package:care_mingle/core/base/base_model.dart';

// ignore: must_be_immutable
class LoginResponse extends BaseModel<LoginResponse> {
  final String? refreshToken;
  final String? accessToken;
  LoginResponse({this.refreshToken, this.accessToken});
  @override
  fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
    );
  }

  @override
  List<Object?> get props => [refreshToken, accessToken];

  @override
  Map<String, dynamic> toJson() {
    return {
      "refreshToken": refreshToken,
      "accessToken": accessToken,
    };
  }
}
