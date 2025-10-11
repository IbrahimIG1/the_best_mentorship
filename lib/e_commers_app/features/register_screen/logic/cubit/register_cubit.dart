import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/network/error/error_model.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/register_screen/data/register_request_model.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/register_screen/logic/repo/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo registerUpRepo;
  RegisterCubit(this.registerUpRepo) : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  bool rememberMe = false;

  void toggleRememberMe(bool value) {
    rememberMe = value;
    emit(RegisterInitial());
  }

  Future<void> register() async {
    emit(RegisterLoadingState());
    final request = RegisterRequestModel(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      password: passwordController.text,
      email: emailController.text,
    );

    final result = await registerUpRepo.register(request);
    result.fold(
      (error) => emit(RegisterErrorState(errorModel: error)),
      (response) => emit(RegisterSuccessState()),
    );
  }
}
