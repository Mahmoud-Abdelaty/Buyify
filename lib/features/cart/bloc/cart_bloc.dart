import 'package:Buyify/features/cart/data/models/cart_model.dart';
import 'package:Buyify/features/cart/data/repo/cart_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartRepoImplement cartRepo;
  num quantity;
  CartBloc(this.cartRepo, {this.quantity = 0}) : super(CartInitial()) {
    on<GetCartDateEvent>((event, emit) async {
      emit(CartLoadingState());
      try {
        var result = await cartRepo.fetchCartData();
        return result.fold(
            (l) => emit(CartFailedState()), (r) => emit(CartSuccessState(r)));
      } catch (e) {
        emit(CartFailedState());
      }
    });

    on<DeleteCartEvent>((event, emit) async {
      emit(DeleteCartLoadingState());
      try {
        var result = await cartRepo.deleteCart(event.cartId);
        return result.fold((l) => emit(DeleteCartFailedState()),
            (r) => emit(DeleteCartSuccessState()));
      } catch (e) {
        emit(DeleteCartFailedState());
      }
    });

    on<UpdateQuantityEvent>((event, emit) async {
      emit(UpdateCartLoadingState());

      try {
        var result = await cartRepo.updateCartQuantity(
          event.cartId,
          {'quantity': event.newQuantity},
        );
        return result.fold((l) => emit(UpdateCartFailedState()),
            (r) => emit(UpdateCartSuccessState()));
      } catch (e) {
        emit(UpdateCartFailedState());
      }
    });

    on<ChangeEvent>((event, emit) {
      quantity = cartRepo.changeQuantity(event.quantity, event.operation);
      add(UpdateQuantityEvent(event.cartId, quantity));
    });
  }
}
