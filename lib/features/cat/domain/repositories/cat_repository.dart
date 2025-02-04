import 'package:cat/core/error/failures.dart';
import 'package:cat/features/cat/domain/entities/cat_breed.dart';
import 'package:cat/features/cat/domain/entities/cat_image.dart';
import 'package:dartz/dartz.dart';

abstract class CatRepository {
  Future<Either<Failure, List<CatBreed>>> getCatBreeds();
  Future<Either<Failure, CatBreed>> getCatBreedById(String breedId);
  Future<Either<Failure, List<CatImage>>> getCatImages(int limit);
  Future<Either<Failure, CatImage>> getCatImageById(String imageId);
  Future<Either<Failure, List<CatImage>>> getCatImagesByBreed(
      String breedId, int limit);
}
