import 'package:Buyify/core/network/response/failure.dart';
import 'package:Buyify/features/cart/data/models/cart_model.dart';
import 'package:Buyify/features/cart/data/models/cart_update_model.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepo {
  Future<Either<Failure?, CartDataModel>> fetchCartData();
  Future<Either<Failure?, CartItemModel>> deleteCart(cartId);
  Future<Either<Failure?, ProductUpdateModel>> updateCartQuantity(
      cartId, Map<String, dynamic> newQuantity);
  num changeQuantity(quantity, operation);
}
