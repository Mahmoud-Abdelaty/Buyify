part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchProductEvent extends SearchEvent {
  final String productName;

  SearchProductEvent(this.productName);
}
