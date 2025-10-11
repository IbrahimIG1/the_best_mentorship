import 'package:get_it/get_it.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/network/api_services/api_services.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/network/api_services/dio_factory.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/cart/logic/cubit/cart_cubit.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/cart/repo/cart_repo.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/login_screen/logic/cubit/login_cubit.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/login_screen/logic/repo/login_repo.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/product_details/logic/cubit/product_details_cubit.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/product_details/repo/product_details_repo.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/register_screen/logic/cubit/register_cubit.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/register_screen/logic/repo/register_repo.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/verify_email/cubit/verify_email_cubit.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/verify_email/repo/verify_email_repo.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/home_screen/repo/home_repo.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/home_screen/logic/cubit/home_cubit.dart';

GetIt getIt = GetIt.instance;

Future<void> setAllDependencies() async{
  getIt.registerLazySingleton<DioFactory>(() => DioFactory());
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(getIt()));

  //* Repo
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiServices>()));
  getIt.registerLazySingleton<RegisterRepo>(
    () => RegisterRepo(getIt<ApiServices>()),
  );
  //*VerifyEmailRepository
  getIt.registerLazySingleton(() => VerifyEmailRepository(getIt()));
  //*HomeRepo
  getIt.registerLazySingleton(() => HomeRepo(getIt()));
  //*ProductDetailsRepo
  getIt.registerLazySingleton(() => ProductDetailsRepo(getIt()));
  //*
  getIt.registerLazySingleton(() => CartRepo(getIt()));
  


  //* Cubits
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt.registerLazySingleton(() => VerifyEmailCubit(getIt()));
  getIt.registerLazySingleton(() => HomeCubit(getIt<HomeRepo>()));
  //*ProductDetailsCubit
  getIt.registerLazySingleton(() => ProductDetailsCubit(getIt()));
  //*CartCubit
  getIt.registerLazySingleton(() => CartCubit(getIt()));
}
