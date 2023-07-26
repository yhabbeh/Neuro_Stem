import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/login_model.dart';
import '../../data/model/login_user_model.dart';
import '../repositories/login_repositories.dart';

class LoginUseCase extends UseCase <LoginModel,LoginUserUseCaseParams>{
  LoginUseCase({required this.repositories});
  LoginRepositories repositories;

  @override
  Future<Either<Failure, LoginModel>> call(LoginUserUseCaseParams params) async{

    return await repositories.loginUser(params.loginUserModel);


  }


}


class LoginUserUseCaseParams extends Equatable {

  const LoginUserUseCaseParams({
    required this.loginUserModel,
  });
  final LoginUserModel loginUserModel;

  @override
  List<Object?> get props => [loginUserModel];
}