import 'package:Buyify/features/home/view/widget/widgets.dart';
import 'package:Buyify/features/user_profile/view/widgets/widgets.dart';
import 'package:Buyify/features/wishlist_view/view/widgets/widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'bottom_nav_bar_event.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  int currentIndex = 0;
  List<Widget> screensList = const [
    HomeView(),
    WishListView(),
    HomeView(),
    UserProfileView(),
  ];
  BottomNavBarBloc() : super(BottomNavBarInitial()) {
    on<ChangeNavBar>((event, emit) {
      try {
        currentIndex = event.index;
        emit(ChangeNavBarState());
      } catch (e) {}
    });
  }
}
