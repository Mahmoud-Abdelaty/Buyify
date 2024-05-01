import 'package:Buyify/core/network/endpoints.dart';
import 'package:Buyify/core/network/error_handling.dart';
import 'package:Buyify/core/network/network_helper.dart';
import 'package:Buyify/core/network/response/failure.dart';
import 'package:Buyify/features/category_view/data/repo/category_repo.dart';
import 'package:Buyify/features/home/data/models/home_model.dart';
import 'package:dartz/dartz.dart';

class CategoryRepoImplement implements CategoryRepo {
  @override
  Future<Either<Failure?, List<ProductModel>>> fetchCategoryData(id) async {
    try {
      var result = await NetworkHelper.instance
          .get(endPoint: EndPoints.CategoryProducts(id));

      var json = result.data['data']['data'];

      List<ProductModel> categoryDataList = [];
      for (var category in json) {
        categoryDataList.add(ProductModel.fromJson(category));
      }
      return right(categoryDataList);
    } catch (e) {
      print(e);
      return left(ErrorHandler.handle(e).failure);
    }
  }
}
