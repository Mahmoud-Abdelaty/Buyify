part of 'user_profile_bloc.dart';

@immutable
abstract class UserProfileEvent {}

class GetUserDataEvent extends UserProfileEvent {}
