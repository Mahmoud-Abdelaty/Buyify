import 'package:Buyify/core/network/endpoints.dart';
import 'package:Buyify/core/network/error_handling.dart';
import 'package:Buyify/core/network/network_helper.dart';
import 'package:Buyify/core/network/response/failure.dart';
import 'package:Buyify/features/user_profile/data/models/user_model.dart';
import 'package:Buyify/features/user_profile/data/repo/user_profile_repo.dart';
import 'package:dartz/dartz.dart';

class UserProfileRepoImplement implements UserProfileRepo {
  @override
  Future<Either<Failure?, UserModel>> getUserData() async {
    try {
      var result =
          await NetworkHelper.instance.get(endPoint: EndPoints.PROFILE);

      var json = result.data['data'];
      var data = UserModel.fromJson(json);

      return right(data);
    } catch (e) {
      print(e);
      return left(ErrorHandler.handle(e).failure);
    }
  }
}
