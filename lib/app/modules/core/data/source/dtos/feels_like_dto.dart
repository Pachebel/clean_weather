import 'dart:convert';

import 'package:clean_weather/app/modules/core/data/extensions/map_parsing_extension.dart';
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
      day: map.parseDouble('day'),
      night: map.parseDouble('night'),
      eve: map.parseDouble('eve'),
      morn: map.parseDouble('morn'),
    );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'day': day,
        'night': night,
        'eve': eve,
        'morn': morn,
      };

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
