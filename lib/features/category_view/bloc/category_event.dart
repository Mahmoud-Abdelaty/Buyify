part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}

class GetCategoryData extends CategoryEvent {
  final int id;

  GetCategoryData(this.id);
}
