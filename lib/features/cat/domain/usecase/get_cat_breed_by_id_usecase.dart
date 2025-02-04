import 'package:cat/core/error/failures.dart';
import 'package:cat/core/usecase/usecase.dart';
import 'package:cat/features/cat/domain/entities/cat_breed.dart';
import 'package:cat/features/cat/domain/repositories/cat_repository.dart';
import 'package:dartz/dartz.dart';

class GetCatBreedByIdUsecase implements UseCase<CatBreed, CatBreedId> {
  final CatRepository catRepository;

  GetCatBreedByIdUsecase(this.catRepository);

  @override
  Future<Either<Failure, CatBreed>> call(CatBreedId params) async {
    return await catRepository.getCatBreedById(params.breadId);
  }
}

class CatBreedId {
  final String breadId;

  CatBreedId(this.breadId);
}
