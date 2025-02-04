import 'package:cat/core/error/failures.dart';
import 'package:cat/core/usecase/usecase.dart';
import 'package:cat/features/cat/domain/entities/cat_breed.dart';
import 'package:cat/features/cat/domain/repositories/cat_repository.dart';
import 'package:dartz/dartz.dart';

class GetCatBreedUsecase implements UseCase<List<CatBreed>, NoParams> {
  final CatRepository catRepository;

  GetCatBreedUsecase(this.catRepository);

  @override
  Future<Either<Failure, List<CatBreed>>> call(NoParams params) async {
    return await catRepository.getCatBreeds();
  }
}
