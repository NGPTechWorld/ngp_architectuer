import 'package:dartz/dartz.dart';
import '../../app/core/errors/failure.dart';
import '../../app/core/params/params.dart';
import '../../domain/entities/template.dart';

abstract class TemplateRepository {
  Future<Either<Failure, TemplateEntity>> getTemp(
      {required TemplateParams params});
  // Future<Either<Failure, TemplateEntity>> postTemp(
  //     {required TemplateParams params});
}
