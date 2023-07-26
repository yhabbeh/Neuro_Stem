import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/repositories/login_repositories.dart';
import '../model/login_model.dart';
import '../model/login_user_model.dart';

class LoginRepositoriesImpl extends LoginRepositories {

  LoginRepositoriesImpl({
    required this.networkInfo,
  });
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, LoginModel>> loginUser(LoginUserModel loginUserModel) {
    throw UnimplementedError();
  }
}
