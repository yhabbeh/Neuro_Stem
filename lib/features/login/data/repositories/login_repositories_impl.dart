import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/repositories/login_repositories.dart';
import '../datasource/login_remote_data_source.dart';
import '../model/login_model.dart';
import '../model/login_user_model.dart';

class LoginRepositoriesImpl extends LoginRepositories {
  LoginRepositoriesImpl(
      {required this.networkInfo, required this.loginRemoteDataSource});
  final LoginRemoteDataSource loginRemoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, LoginUserModel>> loginUser(
      LoginDataModel loginUserModel) async {
    try {
      final LoginUserModel result =
          await loginRemoteDataSource.loginUser(loginUserModel);
      return Right(result);
    } on ServerrException {
      return const Left(ServerFailure());
    }
  }
}
