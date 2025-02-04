import 'package:cat/features/cat/domain/entities/cat_breed.dart';

class CatImage {
  final String id;
  final int width;
  final int height;
  final String url;
  final List<CatBreed>? breeds;

  CatImage({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    this.breeds,
  });
}
