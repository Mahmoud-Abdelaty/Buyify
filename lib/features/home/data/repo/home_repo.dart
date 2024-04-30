import 'package:Buyify/core/network/response/failure.dart';
import 'package:Buyify/features/home/data/models/category_model.dart';
import 'package:Buyify/features/home/data/models/home_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure?, HomeModel>> fetchHomeData();
  Future<Either<Failure?, List<CategoryModel>>> fetchCategoryData();
}
