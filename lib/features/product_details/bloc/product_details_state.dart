part of 'product_details_bloc.dart';

@immutable
abstract class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsSuccess extends ProductDetailsState {
  final ProductModel model;
  ProductDetailsSuccess(this.model);
}

class ProductDetailsError extends ProductDetailsState {}

class ProductAddedFavLoading extends ProductDetailsState {}

class ProductAddedFavSuccess extends ProductDetailsState {
  final FavoritesModel data;
  ProductAddedFavSuccess(this.data);
}

class ProductAddedFavFailed extends ProductDetailsState {}

class ProductAddedToCartLoading extends ProductDetailsState {}

class ProductAddedToCartSuccess extends ProductDetailsState {
  final AddToCartModel data;
  ProductAddedToCartSuccess(this.data);
}

class ProductAddedToCartFailed extends ProductDetailsState {}

class GetFavoriteProductsLoading extends ProductDetailsState {}

class GetFavoriteProductsSuccess extends ProductDetailsState {
  final List<ProductFavModel> data;
  GetFavoriteProductsSuccess(this.data);
}

class GetFavoriteProductsFailed extends ProductDetailsState {}

class GetProductsLoading extends ProductDetailsState {}

class GetProductsSuccess extends ProductDetailsState {
  final HomeModel data;
  GetProductsSuccess(this.data);
}

class GetProductsError extends ProductDetailsState {}
