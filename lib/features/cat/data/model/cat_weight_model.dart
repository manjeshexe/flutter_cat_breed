import 'package:cat/features/cat/domain/entities/cat_weight.dart';

class CatWeightModel extends CatWeight {
  // final String imperial;
  // final String metric;

  // CatWeightModel({
  //   required this.imperial,
  //   required this.metric,
  // });

  CatWeightModel({
    required super.imperial,
    required super.metric,
  });

  factory CatWeightModel.fromJson(Map<String, dynamic> json) {
    return CatWeightModel(
      imperial: json['imperial'] as String,
      metric: json['metric'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imperial': imperial,
      'metric': metric,
    };
  }
}
