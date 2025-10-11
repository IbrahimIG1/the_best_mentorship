import 'package:bloc/bloc.dart';
import '../../repo/product_details_repo.dart';
import 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductDetailsRepo repo;
  ProductDetailsCubit(this.repo) : super(ProductDetailsInitial());

  Future<void> getProductById(String id) async {
    emit(ProductDetailsLoading());
    final result = await repo.getProductById(id);
    result.fold(
      (error) => emit(ProductDetailsError(error)),
      (product) => emit(ProductDetailsLoaded(product)),
    );
  }
}
