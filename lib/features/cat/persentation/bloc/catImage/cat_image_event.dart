part of 'cat_image_bloc.dart';

@immutable
sealed class CatImageEvent {}

class GetCatImageEvent extends CatImageEvent {
  final int limit;

  GetCatImageEvent({required this.limit});
}
