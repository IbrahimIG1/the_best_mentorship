import 'package:bloc/bloc.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/home_screen/logic/cubit/home_state.dart';
import '../../repo/home_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;
  HomeCubit(this.repo) : super(HomeInitial());

  Future<void> getCategories() async {
    emit(HomeLoading());
    final result = await repo.getCategories();
    result.fold(
      (error) => emit(HomeError(error.toString())),
      (categories) => emit(HomeLoaded(categories, [])),
    );
  }

  Future<void> getProducts() async {
    emit(HomeLoading());
    final result = await repo.getProducts();
    result.fold(
      (error) => emit(HomeError(error.toString())),
      (products) => emit(HomeLoaded([], products)),
    );
  }
}
