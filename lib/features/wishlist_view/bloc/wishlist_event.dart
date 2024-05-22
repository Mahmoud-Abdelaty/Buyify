part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class GetWishlistProductsEvent extends WishlistEvent {}

class AddProductWishlist extends WishlistEvent {
  final int id;
  AddProductWishlist(this.id);
}
