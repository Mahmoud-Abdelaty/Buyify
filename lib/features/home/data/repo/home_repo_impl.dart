import 'package:Buyify/core/network/endpoints.dart';
import 'package:Buyify/core/network/error_handling.dart';
import 'package:Buyify/core/network/network_helper.dart';
import 'package:Buyify/core/network/response/failure.dart';
import 'package:Buyify/features/home/data/models/category_model.dart';
import 'package:Buyify/features/home/data/models/home_model.dart';
import 'package:Buyify/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplement implements HomeRepo {
  @override
  Future<Either<Failure?, HomeModel>> fetchHomeData() async {
    try {
      var result =
          await NetworkHelper.instance.get(endPoint: EndPoints.GET_HOME_DATA);
      var json = result.data['data'];

      var data = HomeModel.fromJson(json);

      return right(data);
    } catch (e) {
      print(e);
      return left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure?, List<CategoryModel>>> fetchCategoryData() async {
    try {
      var result =
          await NetworkHelper.instance.get(endPoint: EndPoints.GET_CATEGORIES);

      var json = result.data['data']['data'];
      List<CategoryModel> categoryList = [];

      for (var category in json) {
        categoryList.add(CategoryModel.fromJson(category));
      }

      return right(categoryList);
    } catch (e) {
      print(e);
      return left(ErrorHandler.handle(e).failure);
    }
  }
}
