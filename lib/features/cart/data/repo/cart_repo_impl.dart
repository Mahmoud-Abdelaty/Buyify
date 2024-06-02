import 'package:Buyify/core/network/endpoints.dart';
import 'package:Buyify/core/network/error_handling.dart';
import 'package:Buyify/core/network/network_helper.dart';
import 'package:Buyify/core/network/response/failure.dart';
import 'package:Buyify/features/cart/data/models/cart_model.dart';
import 'package:Buyify/features/cart/data/models/cart_update_model.dart';
import 'package:Buyify/features/cart/data/repo/cart_repo.dart';
import 'package:dartz/dartz.dart';

class CartRepoImplement implements CartRepo {
  @override
  Future<Either<Failure?, CartDataModel>> fetchCartData() async {
    try {
      var result =
          await NetworkHelper.instance.get(endPoint: EndPoints.GET_CARTS);

      var json = result.data['data'];
      var data = CartDataModel.fromMap(json);
      return right(data);
    } catch (e) {
      print(e);
      return left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure?, ProductModelOP>> deleteCart(cartId) async {
    try {
      var result = await NetworkHelper.instance
          .delete(endPoint: EndPoints.DeleteCart(cartId));
      var json = result.data['data'];
      var data = ProductModelOP.fromMap(json);
      return right(data);
    } catch (e) {
      print(e);
      return left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure?, ProductModelOP>> updateCartQuantity(
      cartId, newQuantity) async {
    try {
      var result = await NetworkHelper.instance.put(
        endPoint: EndPoints.UpdateCart(cartId),
        data: newQuantity,
      );

      var json = result.data['data'];
      var data = ProductModelOP.fromMap(json);
      return right(data);
    } catch (e) {
      print(e);
      return left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  num changeQuantity(quantity, operation) {
    if (operation == 'plus') {
      quantity++;
      return quantity;
    } else if (quantity != 1) {
      quantity--;
      return quantity;
    } else {
      return quantity;
    }
  }
}
