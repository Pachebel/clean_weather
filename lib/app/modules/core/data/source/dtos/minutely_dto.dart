import 'dart:convert';

import 'package:clean_weather/app/modules/core/data/extensions/map_parsing_extension.dart';
import 'package:clean_weather/app/modules/core/domain/models/minutely_model.dart';

class MinutelyDto extends MinutelyModel {
  MinutelyDto({super.dt, super.precipitation});

  factory MinutelyDto.fromMap(Map<String, dynamic> map) {
    return MinutelyDto(
      dt: map.parseInt('dt'),
      precipitation: map.parseDouble('precipitation'),
    );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'dt': dt,
        'precipitation': precipitation,
      };

  MinutelyDto.fromModel(MinutelyModel model)
      : super(
          dt: model.dt,
          precipitation: model.precipitation,
        );

  factory MinutelyDto.fromJson(String source) =>
      MinutelyDto.fromMap(json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());
}
