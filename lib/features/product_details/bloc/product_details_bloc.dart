import 'package:Buyify/features/home/data/models/home_model.dart';
import 'package:Buyify/features/product_details/data/models/addToCart_model.dart';
import 'package:Buyify/features/product_details/data/models/favorites_model.dart';
import 'package:Buyify/features/product_details/data/repo/product_details_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final ProductDetailsRepo productDetailsRepo;

  ProductDetailsBloc(this.productDetailsRepo) : super(ProductDetailsInitial()) {
    on<GetProductDetails>((event, emit) async {
      emit(ProductDetailsLoading());
      try {
        var result = await productDetailsRepo.fetchProductDetails(event.id);
        result.fold((l) => emit(ProductDetailsError()),
            (r) => emit(ProductDetailsSuccess(r)));
      } catch (e) {
        emit(ProductDetailsError());
      }
    });

    on<AddProductFav>((event, emit) async {
      emit(ProductAddedFavLoading());
      try {
        var result = await productDetailsRepo.addProductFavorite(event.id);
        result.fold((l) => emit(ProductAddedFavFailed()),
            (r) => emit(ProductAddedFavSuccess(r)));
      } catch (e) {
        emit(ProductAddedFavFailed());
      }
    });

    on<AddProductToCart>((event, emit) async {
      emit(ProductAddedToCartLoading());
      try {
        var result = await productDetailsRepo.addProductToCart(event.id);
        result.fold((l) => emit(ProductAddedToCartFailed()),
            (r) => emit(ProductAddedToCartSuccess(r)));
      } catch (e) {
        emit(ProductAddedToCartFailed());
      }
    });
  }
}
