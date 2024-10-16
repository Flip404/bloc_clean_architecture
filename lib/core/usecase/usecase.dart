import 'package:bloc_clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class Usecase<Success, Params> {
  Future<Either<Failure, Success>> call(Params param);
}

class NoParam {}
