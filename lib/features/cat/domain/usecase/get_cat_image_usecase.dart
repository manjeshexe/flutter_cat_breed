import 'package:cat/core/error/failures.dart';
import 'package:cat/core/usecase/usecase.dart';
import 'package:cat/features/cat/domain/entities/cat_image.dart';
import 'package:cat/features/cat/domain/repositories/cat_repository.dart';
import 'package:dartz/dartz.dart';

class GetCatImageUsecase extends UseCase<List<CatImage>, CatLimit> {
  final CatRepository catRepository;

  GetCatImageUsecase(this.catRepository);

  @override
  Future<Either<Failure, List<CatImage>>> call(CatLimit params) async {
    return await catRepository.getCatImages(params.limit);
  }
}

class CatLimit {
  final int limit;
  CatLimit(this.limit);
}
