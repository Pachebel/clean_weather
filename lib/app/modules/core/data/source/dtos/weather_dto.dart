import 'dart:convert';

import 'package:clean_weather/app/modules/core/domain/models/weather_model.dart';

class WeatherDto extends WeatherModel {
  WeatherDto({super.id, super.main, super.description, super.icon});

  factory WeatherDto.fromMap(Map<String, dynamic> map) {
    return WeatherDto(
      id: map['id'] as int?,
      main: map['main'] as String?,
      description: map['description'] as String?,
      icon: map['icon'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }

  WeatherDto.fromModel(WeatherModel model)
      : super(
          id: model.id,
          main: model.main,
          description: model.description,
          icon: model.icon,
        );

  factory WeatherDto.fromJson(String source) =>
      WeatherDto.fromMap(json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());
}
