part of 'cat_image_bloc.dart';

@immutable
sealed class CatImageState {}

final class CatImageInitial extends CatImageState {}

final class CatImageLoading extends CatImageState {}

final class CatImageLoaded extends CatImageState {
  final List<CatImage> catImage;
  CatImageLoaded({required this.catImage});
}

final class CatImageFailure extends CatImageState {
  final String message;
  CatImageFailure({required this.message});
}
