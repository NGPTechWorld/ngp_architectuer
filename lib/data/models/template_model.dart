import '../../domain/entities/template.dart';

class TemplateModel extends TemplateEntity {
  TemplateModel({required super.temp});

  factory TemplateModel.fromJson(Map<String, dynamic> json) {
    return TemplateModel(temp: json["temp"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "temp": temp,
    };
  }
}
