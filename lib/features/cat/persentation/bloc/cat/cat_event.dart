part of 'cat_bloc.dart';

@immutable
sealed class CatEvent {}

class GetCatBreedEvent extends CatEvent {}

class GetCatBreedByIdEvent extends CatEvent {
  final String breadId;
  GetCatBreedByIdEvent({required this.breadId});
}

class SearchCatBreedEvent extends CatEvent {
  final String query;
  SearchCatBreedEvent({required this.query});
}

class RandomCatImageEvent extends CatEvent {
  final int limit;
  RandomCatImageEvent({required this.limit});
}
