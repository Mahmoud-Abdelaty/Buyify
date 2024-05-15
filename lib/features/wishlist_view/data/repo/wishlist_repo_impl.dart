import 'package:Buyify/core/network/endpoints.dart';
import 'package:Buyify/core/network/error_handling.dart';
import 'package:Buyify/core/network/network_helper.dart';
import 'package:Buyify/core/network/response/failure.dart';
import 'package:Buyify/features/product_details/data/models/product_fav_model.dart';
import 'package:Buyify/features/wishlist_view/data/models/WishhlistProductModel.dart';
import 'package:Buyify/features/wishlist_view/data/repo/wishlist_repo.dart';
import 'package:dartz/dartz.dart';

class WishlistRepoImplement implements WishlistRepo {
  @override
  Future<Either<Failure?, List<WishlistProductModel>>>
      getFavoritesProducts() async {
    try {
      var result =
          await NetworkHelper.instance.get(endPoint: EndPoints.FAVORITES);

      var json = result.data['data']['data'];
      var favoriteList = json
          .map<ProductFavModel>(
              (productJson) => WishlistProductModel.fromJson(productJson))
          .toList();

      return right(favoriteList);
    } catch (e) {
      return left(ErrorHandler.handle(e).failure);
    }
  }
}
