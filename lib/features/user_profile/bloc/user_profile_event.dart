part of 'user_profile_bloc.dart';

@immutable
abstract class UserProfileEvent {}

class GetUserDataEvent extends UserProfileEvent {}

class GetUserAddressEvent extends UserProfileEvent {}

class UpdateUserAddressEvent extends UserProfileEvent {
  final int addressId;
  final Map<String, dynamic> newAddressData;
  UpdateUserAddressEvent(this.addressId, this.newAddressData);
}

class AddUserAddressEvent extends UserProfileEvent {
  final Map<String, dynamic> newAddressData;
  AddUserAddressEvent(this.newAddressData);
}

class DeleteUserAddressEvent extends UserProfileEvent {
  final int addressId;
  DeleteUserAddressEvent(this.addressId);
}
