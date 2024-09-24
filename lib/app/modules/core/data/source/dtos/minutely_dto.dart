import 'dart:convert';

import 'package:clean_weather/app/modules/core/domain/models/minutely_model.dart';

class MinutelyDto extends MinutelyModel {
  MinutelyDto({super.dt, super.precipitation});

  factory MinutelyDto.fromMap(Map<String, dynamic> map) {
    return MinutelyDto(
      dt: int.tryParse(map['dt'].toString()),
      precipitation: double.tryParse(map['precipitation'].toString()),
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
