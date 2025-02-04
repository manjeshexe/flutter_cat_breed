part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  final CatBreed catBreed;
  SearchLoaded({required this.catBreed});
}

final class SearchError extends SearchState {
  final String message;
  SearchError({required this.message});
}
