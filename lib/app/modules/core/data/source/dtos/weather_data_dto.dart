import 'dart:convert';

import 'package:clean_weather/app/modules/core/data/source/dtos/alert_dto.dart';
import 'package:clean_weather/app/modules/core/data/source/dtos/current_weather_dto.dart';
import 'package:clean_weather/app/modules/core/data/source/dtos/daily_dto.dart';
import 'package:clean_weather/app/modules/core/data/source/dtos/hourly_dto.dart';
import 'package:clean_weather/app/modules/core/data/source/dtos/minutely_dto.dart';
import 'package:clean_weather/app/modules/core/domain/models/weather_data_model.dart';

class WeatherDataDto extends WeatherDataModel {
  WeatherDataDto({
    super.lat,
    super.lon,
    super.timezone,
    super.timezoneOffset,
    super.current,
    super.minutely,
    super.hourly,
    super.daily,
    super.alerts,
  });

  factory WeatherDataDto.fromMap(Map<String, dynamic> map) {
    return WeatherDataDto(
      lat: map['lat'] as double?,
      lon: map['lon'] as double?,
      timezone: map['timezone'] as String?,
      timezoneOffset: map['timezone_offset'] as int?,
      current:
          CurrentWeatherDto.fromMap(map['current'] as Map<String, dynamic>),
      minutely: List<Map<String, dynamic>>.from(map['minutely'] as List)
          .map(MinutelyDto.fromMap)
          .toList(),
      hourly: List<Map<String, dynamic>>.from(map['hourly'] as List)
          .map(HourlyDto.fromMap)
          .toList(),
      daily: List<Map<String, dynamic>>.from(map['daily'] as List)
          .map(DailyDto.fromMap)
          .toList(),
      alerts: List<Map<String, dynamic>>.from(map['alerts'] as List)
          .map(AlertDto.fromMap)
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'lat': lat,
        'lon': lon,
        'timezone': timezone,
        'timezone_offset': timezoneOffset,
        'current':
            current != null ? CurrentWeatherDto.fromModel(current!) : null,
        'minutely':
            minutely?.map((e) => MinutelyDto.fromModel(e).toMap()).toList(),
        'hourly': hourly?.map((e) => HourlyDto.fromModel(e).toMap()).toList(),
        'daily': daily?.map((e) => DailyDto.fromModel(e).toMap()).toList(),
        'alerts': alerts?.map((e) => AlertDto.fromModel(e).toMap()).toList(),
      };

  WeatherDataDto.fromModel(WeatherDataModel model)
      : super(
          lat: model.lat,
          lon: model.lon,
          timezone: model.timezone,
          timezoneOffset: model.timezoneOffset,
          current: model.current,
          minutely: model.minutely,
          hourly: model.hourly,
          daily: model.daily,
          alerts: model.alerts,
        );

  factory WeatherDataDto.fromJson(String source) =>
      WeatherDataDto.fromMap(json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());
}
