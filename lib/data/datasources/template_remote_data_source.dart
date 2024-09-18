import '../../app/core/params/params.dart';
import '../../app/services/api/api_services.dart';
import '../../app/services/api/end_points.dart';
import '../models/template_model.dart';

class TemplateRemoteDataSource {
  final ApiServices api;

  TemplateRemoteDataSource({required this.api});
  Future<TemplateModel> getTemplate(TemplateParams params) async {
    final response = await api.get("${EndPoints.template}/${params.id}");
    return TemplateModel.fromJson(response);
  }
}
