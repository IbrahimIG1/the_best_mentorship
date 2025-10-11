import 'package:dio/dio.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/network/api_services/api_services.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/network/error/dio_error_handler.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/network/error/error_model.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/network/urls/api_constants%20.dart';
import 'package:dartz/dartz.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/login_screen/data/login_req_model.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/login_screen/data/login_response_model.dart';

class LoginRepo {
  final ApiServices apiServices;
  LoginRepo(this.apiServices);

  Future<Either<ErrorModel, LoginModelResponse>> login(
    LoginModelRequest loginData,
  ) async {
    try {
      final response = await apiServices.post(
        baseUrl: ApiConstants.loginUrl,
        data: loginData.toJson(),
      );
      LoginModelResponse loginModelResponse = LoginModelResponse.fromJson(
        response.data,
      );
      return right(loginModelResponse);
    } on DioException catch (e) {
      if (e.response != null) {
        print("DioException : ${e.response!.data['message']}");
        final errorData = e.response?.data;
  final errorModel = ErrorModel.fromJson(errorData ?? {});
        return left(
          errorModel
        );
      } else {
        print("DioException else : ${e.message}");
        ErrorModel error = DioExceptionHandler.handleDioError(e);
        return left(error);
      }
    } catch (e) {
      print("catch : ${e.toString()}");
      return left(ErrorModel(message: e.toString()));
    }
  }
}
