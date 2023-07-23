import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:neuro_stem/core/error/failures.dart';
import 'package:neuro_stem/features/login/domain/repositories/login_repositories.dart';

import '../../../../core/usecases/usecase.dart';
import '../../data/model/login_model.dart';
import '../../data/model/login_user_model.dart';

class LoginUseCase extends UseCase <LoginModel,LoginUserUseCaseParams>{
  LoginRepositories repositories;
  LoginUseCase({required this.repositories});

  @override
  Future<Either<Failure, LoginModel>> call(LoginUserUseCaseParams params) async{

    return await repositories.loginUser(params.loginUserModel);


  }


}


class LoginUserUseCaseParams extends Equatable {
  final LoginUserModel loginUserModel;

  const LoginUserUseCaseParams({
    required this.loginUserModel,
  });

  @override
  List<Object?> get props => [loginUserModel];
}