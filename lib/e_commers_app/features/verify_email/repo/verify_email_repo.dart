import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/network/api_services/api_services.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/network/error/dio_error_handler.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/network/error/error_model.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/network/urls/api_constants%20.dart';

class VerifyEmailRepository {
  final ApiServices apiServices;
  VerifyEmailRepository(this.apiServices);

  Future<Either<ErrorModel, void>> resendOtp({required String email}) async {
    try {
      await apiServices.post(
        baseUrl: ApiConstants.resendOtp,
        data: {'email': email},
      );
      return right(null);
    } on DioException catch (e) {
      if (e.response != null) {
        final errorData = e.response?.data;
        final errorModel = ErrorModel.fromJson(errorData ?? {});
        return left(errorModel);
      } else {
        ErrorModel error = DioExceptionHandler.handleDioError(e);
        return left(error);
      }
    } catch (e) {
      return left(ErrorModel(message: e.toString()));
    }
  }


  Future<Either<ErrorModel, bool>> verifyEmail({required String email, required String otp}) async {
    try {
      await apiServices.post(
        baseUrl: ApiConstants.verifyEmail,
        data: {'email': email, 'otp': otp},
      );
      return right(true);
    } on DioException catch (e) {
      if (e.response != null) {
        final errorData = e.response?.data;
        final errorModel = ErrorModel.fromJson(errorData ?? {});
        return left(errorModel);
      } else {
        ErrorModel error = DioExceptionHandler.handleDioError(e);
        return left(error);
      }
    } catch (e) {
      return left(ErrorModel(message: e.toString()));
    }
  }
}
