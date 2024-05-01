import 'package:Buyify/core/network/endpoints.dart';
import 'package:Buyify/core/network/error_handling.dart';
import 'package:Buyify/core/network/network_helper.dart';
import 'package:Buyify/core/network/response/failure.dart';
import 'package:Buyify/features/home/data/models/home_model.dart';
import 'package:Buyify/features/product_details/data/repo/product_details_repo.dart';
import 'package:dartz/dartz.dart';

class ProductDetailsRepoImplement implements ProductDetailsRepo {
  @override
  Future<Either<Failure?, ProductModel>> fetchProductDetails(id) async {
    try {
      var result = await NetworkHelper.instance
          .get(endPoint: EndPoints.ProductDetails(id));

      var json = result.data['data']['data'];

      var data = ProductModel.fromJson(json);

      return right(data);
    } catch (e) {
      return left(ErrorHandler.handle(e).failure);
    }
  }
}
