import 'package:Buyify/core/network/response/failure.dart';
import 'package:Buyify/features/wishlist_view/data/models/WishhlistProductModel.dart';
import 'package:dartz/dartz.dart';

abstract class WishlistRepo {
  Future<Either<Failure?, List<WishlistProductModel>>> getFavoritesProducts();
}
