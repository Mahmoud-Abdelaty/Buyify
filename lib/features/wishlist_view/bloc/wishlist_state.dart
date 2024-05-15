part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

class GetWishlistProductsLoading extends WishlistState {}

class GetWishlistProductsSuccess extends WishlistState {
  final List<WishlistProductModel> data;
  GetWishlistProductsSuccess(this.data);
}

class GetWishlistProductsFailed extends WishlistState {}
