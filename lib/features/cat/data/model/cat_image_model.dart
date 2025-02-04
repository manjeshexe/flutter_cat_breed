import 'package:cat/features/cat/data/model/cat_breed_model.dart';
import 'package:cat/features/cat/domain/entities/cat_image.dart';

class CatImageModel extends CatImage {
  // final String id;
  // final int width;
  // final int height;
  // final String url;
  // final List<CatBreedModel>? breeds;

  CatImageModel({
    required super.id,
    required super.width,
    required super.height,
    required super.url,
    super.breeds,
  });

  factory CatImageModel.fromJson(Map<String, dynamic> json) {
    return CatImageModel(
      id: json['id'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      url: json['url'] as String,
      breeds: (json['breeds'] as List<dynamic>?)
          ?.map(
              (breed) => CatBreedModel.fromJson(breed as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'width': width,
      'height': height,
      'url': url,
      'breeds':
          breeds?.map((breed) => (breed as CatBreedModel).toJson()).toList(),
    };
  }
}
