import 'package:Buyify/core/network/endpoints.dart';
import 'package:Buyify/core/network/error_handling.dart';
import 'package:Buyify/core/network/network_helper.dart';
import 'package:Buyify/core/network/response/failure.dart';
import 'package:Buyify/features/home/data/models/home_model.dart';
import 'package:Buyify/features/product_details/data/models/addToCart_model.dart';
import 'package:Buyify/features/product_details/data/models/favorites_model.dart';
import 'package:Buyify/features/product_details/data/models/product_fav_model.dart';
import 'package:Buyify/features/product_details/data/repo/product_details_repo.dart';
import 'package:dartz/dartz.dart';

class ProductDetailsRepoImplement implements ProductDetailsRepo {
  @override
  Future<Either<Failure?, ProductModel>> fetchProductDetails(id) async {
    try {
      var result = await NetworkHelper.instance
          .get(endPoint: EndPoints.ProductDetails(id));

      var json = result.data['data'];

      var data = ProductModel.fromJson(json);

      return right(data);
    } catch (e) {
      return left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure?, FavoritesModel>> addProductFavorite(id) async {
    try {
      var result = await NetworkHelper.instance.post(
          endPoint: EndPoints.ADD_OR_DELETE_FAVOURITE,
          data: {"product_id": id});
      var json = result.data;
      var data = FavoritesModel.fromJson(json);
      return right(data);
    } catch (e) {
      print(e);
      return left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure?, AddToCartModel>> addProductToCart(id) async {
    try {
      var result = await NetworkHelper.instance.post(
          endPoint: EndPoints.ADD_OR_RRMOVE_CART_WITH_PRODUCT_ID,
          data: {"product_id": id});
      var json = result.data;
      var data = AddToCartModel.fromJson(json);
      return right(data);
    } catch (e) {
      print(e);
      return left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure?, List<ProductFavModel>>> getFavoritesProducts() async {
    try {
      var result =
          await NetworkHelper.instance.get(endPoint: EndPoints.FAVORITES);

      var json = result.data['data']['data'];
      var favoriteList = json
          .map<ProductFavModel>(
              (productJson) => ProductFavModel.fromJson(productJson))
          .toList();

      return right(favoriteList);
    } catch (e) {
      return left(ErrorHandler.handle(e).failure);
    }
  }
}
