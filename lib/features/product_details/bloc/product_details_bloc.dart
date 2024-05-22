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
  final Map<int, bool> inFavorites = {};
  final Map<int, bool> inCart = {};

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
        result.fold((l) => emit(ProductAddedFavFailed()), (r) {
          if (r.status) {
            inFavorites[event.id] = !inFavorites[event.id]!;
          }
          emit(ProductAddedFavSuccess(r));
        });
      } catch (e) {
        emit(ProductAddedFavFailed());
      }
    });

    on<AddProductToCart>((event, emit) async {
      emit(ProductAddedToCartLoading());
      try {
        var result = await productDetailsRepo.addProductToCart(event.id);
        result.fold((l) => emit(ProductAddedToCartFailed()), (r) {
          if (r.status) {
            inCart[event.id] = !inCart[event.id]!;
          }
          emit(ProductAddedToCartSuccess(r));
        });
      } catch (e) {
        emit(ProductAddedToCartFailed());
      }
    });

    on<GetProductsEvent>((event, emit) async {
      emit(GetProductsLoading());
      try {
        var result = await productDetailsRepo.fetchProducts();
        result.fold((l) => emit(GetProductsError()), (r) {
          r.products.map((e) {
            inFavorites.addAll({e.id: e.inFavorites});
            inCart.addAll({e.id: e.inCart});
          }).toList();
          print('AAAAAAAAAAAAAAA${inFavorites}');
          emit(GetProductsSuccess(r));
        });
      } catch (e) {
        emit(GetProductsError());
      }
    });
  }
}
