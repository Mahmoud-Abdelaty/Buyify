part of 'bottom_nav_bar_bloc.dart';

@immutable
abstract class BottomNavBarEvent {}

class ChangeNavBar extends BottomNavBarEvent {
  final int index;
  ChangeNavBar(this.index);
}
