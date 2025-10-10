import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/network/error/error_model.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/login_screen/data/login_req_model.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/login_screen/data/login_response_model.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/login_screen/logic/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  /// Controllers moved here
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool rememberMe = false;

  LoginCubit(this.loginRepo) : super(LoginInitial());

  //* login
  Future<void> login() async {
    emit(LoginLoadingState());
    final loginData = LoginModelRequest(
      email: usernameController.text.trim(),
      password: passwordController.text.trim(),
    );

    final result = await loginRepo.login(loginData);
    result.fold(
      (l) => emit(LoginErrorState(errorModel: l)),
      (r) => emit(LoginSuccessState(loginModelResponse: r)),
    );
  }

  void toggleRemember(bool value) {
    rememberMe = value;
    emit(LoginRememberState(value));
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
