part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class IsVisiblePasswordLoading extends LoginState {}

class IsVisiblePasswordLoaded extends LoginState {}

class LoginDataUserLoading extends LoginState {}

class LoginDataUserLoaded extends LoginState {}
