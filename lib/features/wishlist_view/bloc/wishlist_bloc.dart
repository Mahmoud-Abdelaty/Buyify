import 'package:Buyify/features/wishlist_view/data/models/WishhlistProductModel.dart';
import 'package:Buyify/features/wishlist_view/data/repo/wishlist_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistRepo wishlistRepo;
  WishlistBloc(this.wishlistRepo) : super(WishlistInitial()) {
    on<WishlistEvent>((event, emit) async {
      emit(GetWishlistProductsLoading());
      try {
        var result = await wishlistRepo.getFavoritesProducts();
        result.fold((l) => emit(GetWishlistProductsFailed()), (r) {
          emit(GetWishlistProductsSuccess(r));
        });
      } catch (e) {
        print(e);
        emit(GetWishlistProductsFailed());
      }
    });
  }
}
