part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final LoginModelResponse loginModelResponse;
  LoginSuccessState({required this.loginModelResponse});
}

final class LoginErrorState extends LoginState {
  final ErrorModel errorModel;
  LoginErrorState({required this.errorModel});
}

final class LoginRememberState extends LoginState {
  final bool value;
  LoginRememberState(this.value);
}