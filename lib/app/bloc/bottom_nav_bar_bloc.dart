import 'package:Buyify/features/home/view/widget/widgets.dart';
import 'package:Buyify/features/user_profile/view/widgets/widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'bottom_nav_bar_event.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  int currentIndex = 0;
  List<Widget> screensList = const [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    UserProfile(),
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
