import 'package:Buyify/core/network/response/failure.dart';
import 'package:Buyify/features/product_details/data/models/favorites_model.dart';
import 'package:Buyify/features/wishlist_view/data/models/WishhlistProductModel.dart';
import 'package:dartz/dartz.dart';

abstract class WishlistRepo {
  Future<Either<Failure?, List<WishlistProductModel>>> getWishlistProducts();
  Future<Either<Failure?, FavoritesModel>> addProductWishlist(id);
}
