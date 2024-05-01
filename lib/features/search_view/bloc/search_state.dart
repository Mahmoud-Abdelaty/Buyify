part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

final class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<ProductModel> data;
  SearchSuccess(this.data);
}

class SearchError extends SearchState {}
