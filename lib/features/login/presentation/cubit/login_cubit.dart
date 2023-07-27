import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(BuildContext context) =>
      BlocProvider.of<LoginCubit>(context);

  bool _isVisiblePass = false;
  bool get getIsVisiblePass => _isVisiblePass;
  set setIsVisiblePass(bool value) {
    emit(IsVisiblePasswordLoading());
    _isVisiblePass = value;
    emit(IsVisiblePasswordLoaded());
  }
}
