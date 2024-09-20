import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../app/core/errors/expentions.dart';
import '../../app/core/errors/failure.dart';
import '../../app/core/params/params.dart';
import '../../app/services/connection/network_info.dart';
import '../../domain/entities/template.dart';
import '../datasources/template_datasources/template_local_data_source.dart';
import '../datasources/template_datasources/template_remote_data_source.dart';

abstract class TemplateRepository {
  Future<Either<Failure, TemplateEntity>> getTemp(
      {required TemplateParams params});
}

class TemplateRepositoryImpl extends TemplateRepository {
  final NetworkInfo networkInfo = Get.find();
  final TemplateRemoteDataSource remoteDataSource = Get.find();
  final TemplateLocalDataSource localDataSource = Get.find();
  TemplateRepositoryImpl();

  @override
  Future<Either<Failure, TemplateEntity>> getTemp(
      {required TemplateParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteTemplate = await remoteDataSource.getTemplate(params);
        localDataSource.cacheTemplate(remoteTemplate);
        return Right(remoteTemplate);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localTemplate = await localDataSource.getLastTemplate();
        return Right(localTemplate);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
