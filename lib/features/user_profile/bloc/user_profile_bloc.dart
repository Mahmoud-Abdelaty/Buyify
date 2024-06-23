import 'package:Buyify/features/user_profile/data/models/address_data_model.dart';
import 'package:Buyify/features/user_profile/data/models/address_model.dart';
import 'package:Buyify/features/user_profile/data/models/user_model.dart';
import 'package:Buyify/features/user_profile/data/repo/user_profile_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileRepo userProfileRepo;

  UserProfileBloc(this.userProfileRepo) : super(UserProfileInitial()) {
    on<GetUserDataEvent>((event, emit) async {
      emit(UserProfileLoading());
      try {
        var result = await userProfileRepo.getUserData();
        return result.fold((l) => emit(UserProfileError()),
            (r) => emit(UserProfileSuccess(r)));
      } catch (e) {
        emit(UserProfileError());
      }
    });

    on<GetUserAddressEvent>((event, emit) async {
      emit(UserAddressLoading());
      try {
        var result = await userProfileRepo.getUserAddress();
        return result.fold((l) => emit(UserAddressError()),
            (r) => emit(UserAddressSuccess(r)));
      } catch (e) {
        emit(UserAddressError());
      }
    });

    on<UpdateUserAddressEvent>((event, emit) async {
      emit(UpdateUserAddressLoading());
      try {
        var result = await userProfileRepo.updateUserAddress(
          event.addressId,
          event.newAddressData,
        );
        return result.fold((l) => emit(UpdateUserAddressError()), (r) {
          emit(UpdateUserAddressSuccess(r));
        });
      } catch (e) {
        emit(UpdateUserAddressError());
      }
    });

    on<AddUserAddressEvent>((event, emit) async {
      emit(AddUserAddressLoading());
      try {
        var result = await userProfileRepo.addUserAddress(event.newAddressData);
        return result.fold((l) => emit(AddUserAddressError()), (r) {
          emit(AddUserAddressSuccess(r));
        });
      } catch (e) {
        emit(AddUserAddressError());
      }
    });

    on<DeleteUserAddressEvent>((event, emit) async {
      try {
        var result = await userProfileRepo.deleteUserAddress(event.addressId);
        return result.fold((l) => emit(DeleteUserAddressError()), (r) {
          add(GetUserAddressEvent());
          emit(DeleteUserAddressSuccess(r));
        });
      } catch (e) {
        emit(DeleteUserAddressError());
      }
    });
  }
}
