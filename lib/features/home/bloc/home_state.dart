part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final HomeModel data;
  HomeSuccess(this.data);
}

class HomeError extends HomeState {}

class CategoryLoading extends HomeState {}

class CategorySuccess extends HomeState {
  final List<CategoryModel> data;
  CategorySuccess(this.data);
}

class CategoryError extends HomeState {}
