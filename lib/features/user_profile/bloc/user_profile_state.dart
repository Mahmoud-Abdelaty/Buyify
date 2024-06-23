part of 'user_profile_bloc.dart';

@immutable
sealed class UserProfileState {}

final class UserProfileInitial extends UserProfileState {}

class UserProfileSuccess extends UserProfileState {
  final UserModel data;
  UserProfileSuccess(this.data);
}

class UserProfileLoading extends UserProfileState {}

class UserProfileError extends UserProfileState {}

class UserAddressSuccess extends UserProfileState {
  final AddressDataModel data;
  UserAddressSuccess(this.data);
}

class UserAddressLoading extends UserProfileState {}

class UserAddressError extends UserProfileState {}

class UpdateUserAddressSuccess extends UserProfileState {
  final AddressModel data;
  UpdateUserAddressSuccess(this.data);
}

class UpdateUserAddressLoading extends UserProfileState {}

class UpdateUserAddressError extends UserProfileState {}

class AddUserAddressSuccess extends UserProfileState {
  final AddressModel data;
  AddUserAddressSuccess(this.data);
}

class AddUserAddressLoading extends UserProfileState {}

class AddUserAddressError extends UserProfileState {}

class DeleteUserAddressSuccess extends UserProfileState {
  final AddressModel data;
  DeleteUserAddressSuccess(this.data);
}

class DeleteUserAddressLoading extends UserProfileState {}

class DeleteUserAddressError extends UserProfileState {}
