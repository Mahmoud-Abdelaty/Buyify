import 'package:Buyify/core/network/response/failure.dart';
import 'package:Buyify/features/home/data/models/home_model.dart';
import 'package:Buyify/features/product_details/data/models/addToCart_model.dart';
import 'package:Buyify/features/product_details/data/models/favorites_model.dart';
import 'package:Buyify/features/product_details/data/models/product_fav_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProductDetailsRepo {
  Future<Either<Failure?, ProductModel>> fetchProductDetails(id);
  Future<Either<Failure?, FavoritesModel>> addProductFavorite(id);
  Future<Either<Failure?, AddToCartModel>> addProductToCart(id);
  Future<Either<Failure?, List<ProductFavModel>>> getFavoritesProducts();
  Future<Either<Failure?, HomeModel>> fetchProducts();
}
