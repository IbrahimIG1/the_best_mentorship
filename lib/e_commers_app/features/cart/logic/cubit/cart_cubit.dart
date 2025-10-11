import 'package:bloc/bloc.dart';
import '../../repo/cart_repo.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo repo;
  CartCubit(this.repo) : super(CartInitial());

  Future<void> getCart() async {
    emit(CartLoading());
    final result = await repo.getCart();
    result.fold(
      (error) => emit(CartError(error)),
      (cart) => emit(CartLoaded(cart)),
    );
  }
}
