part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

final class WishlistInitial extends WishlistState {}

class GetWishlistProductsLoading extends WishlistState {}

class GetWishlistProductsSuccess extends WishlistState {
  final List<WishlistProductModel> data;
  GetWishlistProductsSuccess(this.data);
}

class GetWishlistProductsFailed extends WishlistState {}

class ProductAddedWishlistLoading extends WishlistState {}

class ProductAddedWishlistSuccess extends WishlistState {
  final FavoritesModel data;
  ProductAddedWishlistSuccess(this.data);
}

class ProductAddedWishlistFailed extends WishlistState {}
