import 'package:Buyify/core/network/response/failure.dart';
import 'package:Buyify/features/user_profile/data/models/address_data_model.dart';
import 'package:Buyify/features/user_profile/data/models/address_model.dart';
import 'package:Buyify/features/user_profile/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class UserProfileRepo {
  Future<Either<Failure?, UserModel>> getUserData();
  Future<Either<Failure?, AddressDataModel>> getUserAddress();
  Future<Either<Failure?, AddressModel>> updateUserAddress(
      int addressId, Map<String, dynamic> newAddressData);
  Future<Either<Failure?, AddressModel>> addUserAddress(
      Map<String, dynamic> newAddressData);
  Future<Either<Failure?, AddressModel>> deleteUserAddress(int addressId);
}
