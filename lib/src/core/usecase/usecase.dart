import 'package:dartz/dartz.dart';
import 'package:mockapp/src/core/core_exports.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}
