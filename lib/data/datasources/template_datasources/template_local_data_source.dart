import 'dart:convert';
import 'package:get/get.dart';

import '../../../app/core/errors/expentions.dart';
import '../../../app/services/local_storage/cache_services.dart';

import '../../models/template_model.dart';

class TemplateLocalDataSource {
  final CacheServices cache = Get.find();
  final String key = "CachedTemplate";
  TemplateLocalDataSource();

  cacheTemplate(TemplateModel? templateToCache) {
    if (templateToCache != null) {
      cache.saveData(
        key: key,
        value: json.encode(
          templateToCache.toJson(),
        ),
      );
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

  Future<TemplateModel> getLastTemplate() {
    final jsonString = cache.getDataString(key: key);

    if (jsonString != null) {
      return Future.value(TemplateModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}
