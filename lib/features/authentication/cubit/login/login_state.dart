part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoadingState extends LoginState {}

class Unauthenticated extends LoginState {}

class Authenticated extends LoginState {}

class AuthenticationFailed extends LoginState {}
