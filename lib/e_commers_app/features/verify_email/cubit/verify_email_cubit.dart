import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/verify_email/cubit/verify_email_state.dart';
import '../repo/verify_email_repo.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final VerifyEmailRepository repository;
  VerifyEmailCubit(this.repository) : super(VerifyEmailInitial());

  Future<void> verifyEmail(String email, String otp) async {
    emit(VerifyEmailLoading());

    final success = await repository.verifyEmail(email: email, otp: otp);

    success.fold(
      (e) {
        emit(VerifyEmailFailure(e.toString()));
      },
      (success) {
        emit(VerifyEmailSuccess());
      },
    );
  }

  Future<void> resendOtp(String email) async {
    emit(VerifyEmailLoading());
    final success = await repository.resendOtp(email: email);
    success.fold(
      (e) {
        emit(VerifyEmailFailure(e.toString()));
      },
      (success) {
        emit(VerifyEmailSuccess());
      },
    );
  }
}
