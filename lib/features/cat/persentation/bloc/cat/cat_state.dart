part of 'cat_bloc.dart';

@immutable
sealed class CatState {}

final class CatInitial extends CatState {}

final class CatLoading extends CatState {}

final class CatLoaded extends CatState {
  final List<CatBreed> catBreeds;
  CatLoaded({required this.catBreeds});
}

final class CatFailure extends CatState {
  final String message;
  CatFailure({required this.message});
}

final class SearchCatBreedLoaded extends CatState {
  final CatBreed catBreed;
  SearchCatBreedLoaded({required this.catBreed});
}

final class RandomCatImage extends CatState {
  final List<CatImage> catImage;
  RandomCatImage({required this.catImage});
}
