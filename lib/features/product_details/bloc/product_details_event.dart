part of 'product_details_bloc.dart';

@immutable
abstract class ProductDetailsEvent {}

class GetProductDetails extends ProductDetailsEvent {
  final int id;
  GetProductDetails(this.id);
}

class AddProductFav extends ProductDetailsEvent {
  final int id;
  AddProductFav(this.id);
}

class AddProductToCart extends ProductDetailsEvent {
  final int id;
  AddProductToCart(this.id);
}

class GetFavoriteProducts extends ProductDetailsEvent {}

class GetProductsEvent extends ProductDetailsEvent {}
