class LoginUserModel{

  String? username;
  String? password;

  LoginUserModel({
    this.username,
    this.password,
  });

  LoginUserModel.fromJson(Map<String, dynamic> json) {
    username = json['Username'];
    password = json['Password'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Username':username,
      'Password':password,
    };
  }
}