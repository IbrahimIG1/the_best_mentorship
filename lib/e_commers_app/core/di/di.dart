import 'package:get_it/get_it.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/network/api_services/api_services.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/network/api_services/dio_factory.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/login_screen/logic/cubit/login_cubit.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/login_screen/logic/repo/login_repo.dart';

GetIt getIt = GetIt.instance;

void setAllDependencies() {
  DioFactory dioFactory = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dioFactory));

  //* Repo
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiServices>()));
  


  //* Cubits
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
}