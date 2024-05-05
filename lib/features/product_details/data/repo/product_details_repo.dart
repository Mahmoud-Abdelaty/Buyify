import 'package:Buyify/core/network/response/failure.dart';
import 'package:Buyify/features/home/data/models/home_model.dart';
import 'package:Buyify/features/product_details/data/models/Favorite_Model.dart';
import 'package:dartz/dartz.dart';

abstract class ProductDetailsRepo {
  Future<Either<Failure?, ProductModel>> fetchProductDetails(id);
  Future<Either<Failure?, FavoriteModel>> addProductFavorite(id);
}
