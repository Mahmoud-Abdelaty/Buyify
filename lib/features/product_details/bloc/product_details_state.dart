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
  final FavoriteModel data;
  ProductAddedFavSuccess(this.data);
}

class ProductAddedFavFailed extends ProductDetailsState {}
