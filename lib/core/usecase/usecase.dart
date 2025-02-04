import 'package:cat/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}
