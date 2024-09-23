import 'dart:convert';

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
      day: map['day'] as double?,
      min: map['min'] as double?,
      max: map['max'] as double?,
      night: map['night'] as double?,
      eve: map['eve'] as double?,
      morn: map['morn'] as double?,
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
