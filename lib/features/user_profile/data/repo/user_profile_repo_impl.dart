import 'package:Buyify/core/network/endpoints.dart';
import 'package:Buyify/core/network/error_handling.dart';
import 'package:Buyify/core/network/network_helper.dart';
import 'package:Buyify/core/network/response/failure.dart';
import 'package:Buyify/features/user_profile/data/models/address_data_model.dart';
import 'package:Buyify/features/user_profile/data/models/address_model.dart';
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

  @override
  Future<Either<Failure?, AddressDataModel>> getUserAddress() async {
    try {
      var result =
          await NetworkHelper.instance.get(endPoint: EndPoints.GET_ADDRESS);

      var json = result.data['data'];
      var data = AddressDataModel.fromJson(json);

      return right(data);
    } catch (e) {
      print(e);
      return left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure?, AddressModel>> updateUserAddress(
    int addressId,
    Map<String, dynamic> newAddressData,
  ) async {
    try {
      var result = await NetworkHelper.instance.put(
        endPoint: EndPoints.UpdateAddress(addressId),
        data: newAddressData,
      );
      var json = result.data;
      var data = AddressModel.fromJson(json);
      return right(data);
    } catch (e) {
      print(e);
      return left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure?, AddressModel>> addUserAddress(
      Map<String, dynamic> newAddressData) async {
    try {
      var result = await NetworkHelper.instance.post(
        endPoint: EndPoints.NEW_ADDRESS,
        data: newAddressData,
      );
      var json = result.data;
      var data = AddressModel.fromJson(json);
      return right(data);
    } catch (e) {
      print(e);
      return left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure?, AddressModel>> deleteUserAddress(
    int addressId,
  ) async {
    try {
      var result = await NetworkHelper.instance.delete(
        endPoint: EndPoints.DeleteAddress(addressId),
      );
      var json = result.data;
      var data = AddressModel.fromJson(json);
      return right(data);
    } catch (e) {
      print(e);
      return left(ErrorHandler.handle(e).failure);
    }
  }
}
