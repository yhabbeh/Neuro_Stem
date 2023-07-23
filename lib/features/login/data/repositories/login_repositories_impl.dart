import 'package:dartz/dartz.dart';
import 'package:neuro_stem/core/error/failures.dart';
import 'package:neuro_stem/core/platform/network_info.dart';
import 'package:neuro_stem/features/login/data/model/login_model.dart';
import 'package:neuro_stem/features/login/data/model/login_user_model.dart';
import 'package:neuro_stem/features/login/domain/repositories/login_repositories.dart';

class LoginRepositoriesImpl extends LoginRepositories {
  final NetworkInfo networkInfo;

  LoginRepositoriesImpl({
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, LoginModel>> loginUser(LoginUserModel loginUserModel) {
    throw UnimplementedError();
  }
}
