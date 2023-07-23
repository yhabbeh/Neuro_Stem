 
import '../model/login_model.dart';
import '../model/login_user_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginModel>loginUser(LoginUserModel loginUserModel);
  
}


class LoginRemoteDataSourceImpl implements LoginRemoteDataSource{
  @override
  Future<LoginModel> loginUser(LoginUserModel loginUserModel) {
    // this is request API ??
    throw UnimplementedError();
  }
  
  
}