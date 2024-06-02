part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

final class CartInitial extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {
  final CartDataModel data;

  CartSuccessState(this.data);
}

class CartFailedState extends CartState {}

class DeleteCartLoadingState extends CartState {}

class DeleteCartFailedState extends CartState {}

class UpdateCartLoadingState extends CartState {}

class UpdateCartFailedState extends CartState {}
