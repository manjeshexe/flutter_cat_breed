part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class SearchEventChanged extends SearchEvent {
  final String query;

  SearchEventChanged(this.query);
}
