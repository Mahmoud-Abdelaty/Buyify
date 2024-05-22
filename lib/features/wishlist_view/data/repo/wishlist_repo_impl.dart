import 'package:Buyify/core/network/endpoints.dart';
import 'package:Buyify/core/network/error_handling.dart';
import 'package:Buyify/core/network/network_helper.dart';
import 'package:Buyify/core/network/response/failure.dart';
import 'package:Buyify/features/product_details/data/models/favorites_model.dart';
import 'package:Buyify/features/wishlist_view/data/models/WishhlistProductModel.dart';
import 'package:Buyify/features/wishlist_view/data/repo/wishlist_repo.dart';
import 'package:dartz/dartz.dart';

class WishlistRepoImplement implements WishlistRepo {
  @override
  Future<Either<Failure?, List<WishlistProductModel>>>
      getWishlistProducts() async {
    try {
      var result =
          await NetworkHelper.instance.get(endPoint: EndPoints.FAVORITES);

      var json = result.data['data']['data'];
      var favoriteList = json
          .map<WishlistProductModel>(
              (productJson) => WishlistProductModel.fromJson(productJson))
          .toList();

      return right(favoriteList);
    } catch (e) {
      print(e);
      return left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure?, FavoritesModel>> addProductWishlist(id) async {
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
}
