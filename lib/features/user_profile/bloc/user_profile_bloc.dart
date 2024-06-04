import 'package:Buyify/features/user_profile/data/models/address_model.dart';
import 'package:Buyify/features/user_profile/data/models/user_model.dart';
import 'package:Buyify/features/user_profile/data/repo/user_profile_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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
  }
}
