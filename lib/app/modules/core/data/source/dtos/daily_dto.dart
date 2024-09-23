import 'dart:convert';

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
      dt: map['dt'] as int?,
      sunrise: map['sunrise'] as int?,
      sunset: map['sunset'] as int?,
      moonrise: map['moonrise'] as int?,
      moonset: map['moonset'] as int?,
      moonPhase: map['moonPhase'] as double?,
      summary: map['summary'] as String?,
      temp: TempDto.fromMap(map['temp'] as Map<String, dynamic>),
      feelsLike: FeelsLikeDto.fromMap(map['feelsLike'] as Map<String, dynamic>),
      pressure: map['pressure'] as int?,
      humidity: map['humidity'] as int?,
      dewPoint: map['dewPoint'] as double?,
      windSpeed: map['windSpeed'] as double?,
      windDeg: map['windDeg'] as int?,
      windGust: map['windGust'] as double?,
      weather: List<Map<String, dynamic>>.from(map['weather'] as List)
          .map(WeatherDto.fromMap)
          .toList(),
      clouds: map['clouds'] as int?,
      pop: map['pop'] as double?,
      rain: map['rain'] as double?,
      uvi: map['uvi'] as double?,
    );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'dt': dt,
        'sunrise': sunrise,
        'sunset': sunset,
        'moonrise': moonrise,
        'moonset': moonset,
        'moonPhase': moonPhase,
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
