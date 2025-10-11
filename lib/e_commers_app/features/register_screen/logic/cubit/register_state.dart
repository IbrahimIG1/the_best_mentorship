part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterErrorState extends RegisterState {
  final ErrorModel errorModel;

  RegisterErrorState({required this.errorModel});
}

final class RegisterSuccessState extends RegisterState {}
