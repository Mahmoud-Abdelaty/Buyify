import 'package:Buyify/core/network/endpoints.dart';
import 'package:Buyify/core/network/error_handling.dart';
import 'package:Buyify/core/network/network_helper.dart';
import 'package:Buyify/core/network/response/failure.dart';
import 'package:Buyify/features/home/data/models/home_model.dart';
import 'package:Buyify/features/search_view/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchRepoImplement implements SearchRepo {
  @override
  Future<Either<Failure?, List<ProductModel>>> searchProduct(
      {required Map<String, dynamic> productName}) async {
    try {
      var result = await NetworkHelper.instance
          .post(endPoint: EndPoints.SEARCH_PRODUCTS, data: productName);

      var json = result.data['data']['data'];

      var product = json
          .map<ProductModel>((product) => ProductModel.fromJson(product))
          .toList();
      return right(product);
    } catch (e) {
      print(e);
      return left(ErrorHandler.handle(e).failure);
    }
  }
}
