// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginUserModel loginModelFromJson(String str) => LoginUserModel.fromJson(json.decode(str));

String loginModelToJson(LoginUserModel data) => json.encode(data.toJson());

class LoginUserModel {

  LoginUserModel({
    required this.isSuccess,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
    isSuccess: json['isSuccess'],
  );
  bool isSuccess;

  Map<String, dynamic> toJson() => {
    "isSuccess": false
  };
}