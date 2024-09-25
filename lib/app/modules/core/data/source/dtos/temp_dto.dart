import 'dart:convert';

import 'package:clean_weather/app/modules/core/data/extensions/map_parsing_extension.dart';
import 'package:clean_weather/app/modules/core/domain/models/temp_model.dart';

class TempDto extends TempModel {
  TempDto({
    super.day,
    super.min,
    super.max,
    super.night,
    super.eve,
    super.morn,
  });

  factory TempDto.fromMap(Map<String, dynamic> map) {
    return TempDto(
      day: map.parseDouble('day'),
      min: map.parseDouble('min'),
      max: map.parseDouble('max'),
      night: map.parseDouble('night'),
      eve: map.parseDouble('eve'),
      morn: map.parseDouble('morn'),
    );
  }

  TempDto.fromModel(TempModel model)
      : super(
          day: model.day,
          min: model.min,
          max: model.max,
          night: model.night,
          eve: model.eve,
          morn: model.morn,
        );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'day': day,
        'min': min,
        'max': max,
        'night': night,
        'eve': eve,
        'morn': morn,
      };

  factory TempDto.fromJson(String source) =>
      TempDto.fromMap(json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());
}
