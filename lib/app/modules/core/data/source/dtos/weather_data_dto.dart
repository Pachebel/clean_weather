import 'dart:convert';

import 'package:clean_weather/app/modules/core/data/extensions/map_parsing_extension.dart';
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
      lat: map.parseDouble('lat'),
      lon: map.parseDouble('lon'),
      timezone: map.parseString('timezone'),
      timezoneOffset: map.parseInt('timezone_offset'),
      current: map.parseCurrentWeather('current'),
      minutely: map.parseMinutelyList('minutely'),
      hourly: map.parseHourlyList('hourly'),
      daily: map.parseDailyList('daily'),
      alerts: map.parseAlertList('alerts'),
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

extension on Map<String, dynamic> {
  CurrentWeatherDto? parseCurrentWeather(String key) {
    if (this[key] != null) {
      return CurrentWeatherDto.fromMap(this[key] as Map<String, dynamic>);
    }
    return null;
  }

  List<MinutelyDto>? parseMinutelyList(String key) {
    if (this[key] != null) {
      return List<Map<String, dynamic>>.from(this[key] as List)
          .map(MinutelyDto.fromMap)
          .toList();
    }
    return null;
  }

  List<HourlyDto>? parseHourlyList(String key) {
    if (this[key] != null) {
      return List<Map<String, dynamic>>.from(this[key] as List)
          .map(HourlyDto.fromMap)
          .toList();
    }
    return null;
  }

  List<DailyDto>? parseDailyList(String key) {
    if (this[key] != null) {
      return List<Map<String, dynamic>>.from(this[key] as List)
          .map(DailyDto.fromMap)
          .toList();
    }
    return null;
  }

  List<AlertDto>? parseAlertList(String key) {
    if (this[key] != null) {
      return List<Map<String, dynamic>>.from(this[key] as List)
          .map(AlertDto.fromMap)
          .toList();
    }
    return null;
  }
}
