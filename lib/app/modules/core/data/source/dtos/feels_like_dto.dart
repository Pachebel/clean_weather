import 'dart:convert';

import 'package:clean_weather/app/modules/core/domain/models/feels_like_model.dart';

class FeelsLikeDto extends FeelsLikeModel {
  FeelsLikeDto({
    super.day,
    super.night,
    super.eve,
    super.morn,
  });

  factory FeelsLikeDto.fromMap(Map<String, dynamic> map) {
    return FeelsLikeDto(
      day: map['day'] as double?,
      night: map['night'] as double?,
      eve: map['eve'] as double?,
      morn: map['morn'] as double?,
    );
  }

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    data['day'] = day;
    data['night'] = night;
    data['eve'] = eve;
    data['morn'] = morn;
    return data;
  }

  FeelsLikeDto.fromModel(FeelsLikeModel model)
      : super(
          day: model.day,
          night: model.night,
          eve: model.eve,
          morn: model.morn,
        );

  factory FeelsLikeDto.fromJson(String source) =>
      FeelsLikeDto.fromMap(json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());
}
