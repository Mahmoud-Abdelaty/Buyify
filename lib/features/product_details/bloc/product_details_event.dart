part of 'product_details_bloc.dart';

@immutable
abstract class ProductDetailsEvent {}

class GetProductDetails extends ProductDetailsEvent {
  final int id;
  GetProductDetails(this.id);
}
