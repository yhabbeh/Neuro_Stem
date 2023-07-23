import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/login_model.dart';
import '../../data/model/login_user_model.dart';

abstract class LoginRepositories{
  Future<Either<Failure , LoginModel>>loginUser(LoginUserModel loginUserModel);
}

