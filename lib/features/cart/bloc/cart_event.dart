part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class GetCartDateEvent extends CartEvent {}

class DeleteCartEvent extends CartEvent {
  final dynamic cartId;

  DeleteCartEvent(this.cartId);
}

class UpdateQuantityEvent extends CartEvent {
  final dynamic cartId;
  final dynamic newQuantity;

  UpdateQuantityEvent(this.cartId, this.newQuantity);
}

class ChangeEvent extends CartEvent {
  final num quantity;
  final String operation;
  final num cartId;

  ChangeEvent(this.quantity, this.operation, this.cartId);
}
