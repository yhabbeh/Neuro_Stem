import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/login_model.dart';
import '../../data/model/login_user_model.dart';

abstract class LoginRepositories{
  Future<Either<Failure , LoginUserModel>>loginUser(LoginDataModel loginUserModel);
}

