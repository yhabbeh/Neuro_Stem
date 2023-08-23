import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../home/presentation/page/home_page.dart';
import '../../data/model/login_model.dart';
import '../../data/model/login_user_model.dart';
import '../../domain/usecase/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());
  final LoginUseCase loginUseCase;

  static LoginCubit get(BuildContext context) =>
      BlocProvider.of<LoginCubit>(context);

  LoginUserModel? loginDataResultModel;

  Future<void> userLogin(LoginDataModel loginUserModel, BuildContext context) async {
    emit(LoginDataUserLoading());
    final Either<Failure, LoginUserModel> result = await loginUseCase
        .call(LoginUserUseCaseParams(loginUserModel: loginUserModel));
    result.fold(
            (Failure l) => null,
            (LoginUserModel r) {
      loginDataResultModel = r;

    });
    log('response');
    if(loginDataResultModel!.isSuccess) {
      log(loginDataResultModel!.isSuccess.toString());
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  HomePage()));
      emit(LoginDataUserLoaded());
    } else {
      emit(LoginDataUserLoading());
    }
  }

  bool _isVisiblePass = false;

  bool get getIsVisiblePass => _isVisiblePass;

  set setIsVisiblePass(bool value) {
    emit(IsVisiblePasswordLoading());
    _isVisiblePass = value;
    emit(IsVisiblePasswordLoaded());
  }
}
