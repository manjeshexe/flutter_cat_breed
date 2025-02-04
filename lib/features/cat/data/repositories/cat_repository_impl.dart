import 'package:cat/core/error/failures.dart';
import 'package:cat/features/cat/data/datasource/remote_datasource.dart';
import 'package:cat/features/cat/domain/entities/cat_breed.dart';
import 'package:cat/features/cat/domain/entities/cat_image.dart';
import 'package:cat/features/cat/domain/repositories/cat_repository.dart';
import 'package:dartz/dartz.dart';

class CatRepositoryImpl implements CatRepository {
  final RemoteDataSource catRemoteDataSource;

  CatRepositoryImpl({required this.catRemoteDataSource});

  @override
  Future<Either<Failure, CatBreed>> getCatBreedById(String breedId) async {
    try {
      final response = await catRemoteDataSource.getCatBreedById(breedId);
      return Right(response);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CatBreed>>> getCatBreeds() async {
    try {
      final response = await catRemoteDataSource.getCatBreeds();
      return Right(response);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CatImage>> getCatImageById(String imageId) async {
    try {
      final response = await catRemoteDataSource.getCatImageById(imageId);
      return Right(response);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CatImage>>> getCatImages(int limit) async {
    try {
      final response = await catRemoteDataSource.getCatImages(limit);
      return Right(response);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CatImage>>> getCatImagesByBreed(
      String breedId, int limit) async {
    try {
      final response =
          await catRemoteDataSource.getCatImagesByBreed(breedId, limit);
      return Right(response);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
