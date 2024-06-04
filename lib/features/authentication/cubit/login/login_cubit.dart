import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/caching/caching_key.dart';
import '../../../../core/caching/shared_helper.dart';
import '../../data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final email = BehaviorSubject<String?>();
  final password = BehaviorSubject<String?>();
  bool visibility = true;

  LoginCubit() : super(Unauthenticated());
  Function(String?) get updateEmail => email.sink.add;

  Function(String?) get updatePassword => password.sink.add;

  Stream<String?> get emailStream => email.stream.asBroadcastStream();

  Stream<String?> get passwordStream => password.stream.asBroadcastStream();

  void changePasswordVisibility() {
    visibility = !visibility;
    emit(Unauthenticated());
  }

  void login(context) async {
    emit(Unauthenticated());
    if (await email.isEmpty) {
      return null;
    }
    try {
      emit(LoadingState());
      var user = await LoginRepo.login(
        password: password.valueOrNull,
        username: email.valueOrNull,
      );
      if (user.accessToken != null) {
        SharedHelper.instance!.writeData(
          CachingKey.TOKEN,
          user.accessToken,
        );
        SharedHelper.instance!.writeData(CachingKey.IS_LOGIN, true);
        SharedHelper.instance!.writeData(
          CachingKey.USER,
          json.encode(user.toJson()),
        );
        // NavigationHelper.navigateToReplacement(AppRoute.HOME);
        emit(Authenticated());
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Invalid credentials')));
      emit(AuthenticationFailed());
    }
  }

  @override
  Future<void> close() {
    email.close();
    password.close();
    return super.close();
  }
}
