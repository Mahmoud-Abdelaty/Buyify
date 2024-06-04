part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

final class CategoryInitial extends CategoryState {}

class GetCategoryLoading extends CategoryState {}

class GetCategorySuccess extends CategoryState {
  final List<ProductModel> data;
  GetCategorySuccess(this.data);
}

class GetCategoryError extends CategoryState {}
