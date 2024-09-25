import 'dart:convert';

import 'package:clean_weather/app/modules/core/data/extensions/dto_parsing_extension.dart';
import 'package:clean_weather/app/modules/core/data/extensions/map_parsing_extension.dart';
import 'package:clean_weather/app/modules/core/data/source/dtos/feels_like_dto.dart';
import 'package:clean_weather/app/modules/core/data/source/dtos/temp_dto.dart';
import 'package:clean_weather/app/modules/core/data/source/dtos/weather_dto.dart';
import 'package:clean_weather/app/modules/core/domain/models/daily_model.dart';

class DailyDto extends DailyModel {
  DailyDto({
    super.dt,
    super.sunrise,
    super.sunset,
    super.moonrise,
    super.moonset,
    super.moonPhase,
    super.summary,
    super.temp,
    super.feelsLike,
    super.pressure,
    super.humidity,
    super.dewPoint,
    super.windSpeed,
    super.windDeg,
    super.windGust,
    super.weather,
    super.clouds,
    super.pop,
    super.rain,
    super.uvi,
  });

  factory DailyDto.fromMap(Map<String, dynamic> map) {
    return DailyDto(
      dt: map.parseInt('dt'),
      sunrise: map.parseInt('sunrise'),
      sunset: map.parseInt('sunset'),
      moonrise: map.parseInt('moonrise'),
      moonset: map.parseInt('moonset'),
      moonPhase: map.parseDouble('moon_phase'),
      summary: map.parseString('summary'),
      temp: map.parseTemp(),
      feelsLike: map.parseFeelsLike(),
      pressure: map.parseInt('pressure'),
      humidity: map.parseInt('humidity'),
      dewPoint: map.parseDouble('dew_point'),
      windSpeed: map.parseDouble('wind_speed'),
      windDeg: map.parseInt('wind_deg'),
      windGust: map.parseDouble('wind_gust'),
      weather: map.parseWeatherList('weather'),
      clouds: map.parseInt('clouds'),
      pop: map.parseDouble('pop'),
      rain: map.parseDouble('rain'),
      uvi: map.parseDouble('uvi'),
    );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'dt': dt,
        'sunrise': sunrise,
        'sunset': sunset,
        'moonrise': moonrise,
        'moonset': moonset,
        'moon_phase': moonPhase,
        'summary': summary,
        'temp': temp != null ? TempDto.fromModel(temp!) : null,
        'feels_like':
            feelsLike != null ? FeelsLikeDto.fromModel(feelsLike!) : null,
        'pressure': pressure,
        'humidity': humidity,
        'dew_point': dewPoint,
        'wind_speed': windSpeed,
        'wind_deg': windDeg,
        'wind_gust': windGust,
        'weather':
            weather?.map((v) => WeatherDto.fromModel(v).toMap()).toList(),
        'clouds': clouds,
        'pop': pop,
        'rain': rain,
        'uvi': uvi,
      };

  DailyDto.fromModel(DailyModel model)
      : super(
          dt: model.dt,
          sunrise: model.sunrise,
          sunset: model.sunset,
          moonrise: model.moonrise,
          moonset: model.moonset,
          moonPhase: model.moonPhase,
          summary: model.summary,
          temp: model.temp,
          feelsLike: model.feelsLike,
          pressure: model.pressure,
          humidity: model.humidity,
          dewPoint: model.dewPoint,
          windSpeed: model.windSpeed,
          windDeg: model.windDeg,
          windGust: model.windGust,
          weather: model.weather,
          clouds: model.clouds,
          pop: model.pop,
          rain: model.rain,
          uvi: model.uvi,
        );

  factory DailyDto.fromJson(String source) =>
      DailyDto.fromMap(json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());
}

// Local extension to parse nested data
extension on Map<String, dynamic> {
  TempDto? parseTemp() {
    final tempData = this['temp'];
    if (tempData == null) return null;
    return TempDto.fromMap(_parseJsonIfString(tempData));
  }

  FeelsLikeDto? parseFeelsLike() {
    final feelsLikeData = this['feels_like'];
    if (feelsLikeData == null) return null;
    return FeelsLikeDto.fromMap(_parseJsonIfString(feelsLikeData));
  }

  static Map<String, dynamic> _parseJsonIfString(dynamic data) {
    if (data is String) {
      return json.decode(data) as Map<String, dynamic>;
    }
    return data as Map<String, dynamic>;
  }
}
