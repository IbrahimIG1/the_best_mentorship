import 'package:get_it/get_it.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/network/api_services/api_services.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/network/api_services/dio_factory.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/login_screen/logic/cubit/login_cubit.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/login_screen/logic/repo/login_repo.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/register_screen/logic/cubit/register_cubit.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/register_screen/logic/repo/register_repo.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/verify_email/cubit/verify_email_cubit.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/verify_email/repo/verify_email_repo.dart';

GetIt getIt = GetIt.instance;

void setAllDependencies() {
  getIt.registerLazySingleton<DioFactory>(() => DioFactory());
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(getIt()));

  //* Repo
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiServices>()));
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt<ApiServices>()));
  //*VerifyEmailRepository
  getIt.registerLazySingleton(() => VerifyEmailRepository(getIt()));


  


  //* Cubits
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt.registerLazySingleton(() => VerifyEmailCubit(getIt()));
  
}