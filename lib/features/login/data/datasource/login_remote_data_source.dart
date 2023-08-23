import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/resources/constants.dart';
import '../model/login_model.dart';
import '../model/login_user_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginUserModel> loginUser(LoginDataModel loginUserModel);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final http.Client api = http.Client();

  @override
  Future<LoginUserModel> loginUser(LoginDataModel loginUserModel) async {
    final Uri url = Uri.parse(BASE_URL + LOGIN);

    final http.Response response = await api.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(loginUserModel.toJson()), // JSON-encode the data
    );

    if (response.statusCode == 200) {
      return LoginUserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to login'); // Handle error appropriately
    }
  }
}
