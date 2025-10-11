import '../../data/category_model.dart';
import '../../data/product_model.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<CategoryModel> categories;
  final List<ProductModel> products;
  HomeLoaded(this.categories, this.products);
}

final class HomeError extends HomeState {
  final String error;
  HomeError(this.error);
}
