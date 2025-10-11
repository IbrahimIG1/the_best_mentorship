import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/local/secure_storage_helper.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/network/api_services/api_services.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/network/error/dio_error_handler.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/network/error/error_model.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/network/urls/api_constants%20.dart';
import 'package:omar_ahmed_mentor_ship/main.dart' as SharedPrefKeys;
import '../data/category_model.dart';
import '../data/product_model.dart';

class HomeRepo {
  final ApiServices apiServices;
  HomeRepo(this.apiServices);

  Future<Either<ErrorModel, List<CategoryModel>>> getCategories() async {
    try {
      final response = await apiServices.get(
        baseUrl: ApiConstants.categoriesUrl,
        data: {
          "refreshToken": await AppSecureStorageHelper.getToken(
            SharedPrefKeys.token,
          ),
        },
      );
      return right(response.map((e) => CategoryModel.fromJson(e)).toList());
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

  Future<Either<ErrorModel, List<ProductModel>>> getProducts() async {
    try {
      final response = await apiServices.get(baseUrl: ApiConstants.productsUrl);
      return right(response.map((e) => ProductModel.fromJson(e)).toList());
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
