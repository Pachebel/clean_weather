import 'dart:convert';

import 'package:clean_weather/app/modules/core/data/source/dtos/weather_dto.dart';
import 'package:clean_weather/app/modules/core/domain/models/hourly_model.dart';

class HourlyDto extends HourlyModel {
  HourlyDto({
    super.dt,
    super.temp,
    super.feelsLike,
    super.pressure,
    super.humidity,
    super.dewPoint,
    super.uvi,
    super.clouds,
    super.visibility,
    super.windSpeed,
    super.windDeg,
    super.windGust,
    super.weather,
    super.pop,
  });

  factory HourlyDto.fromMap(Map<String, dynamic> map) {
    return HourlyDto(
      dt: map['dt'] as int?,
      temp: map['temp'] as double?,
      feelsLike: map['feels_like'] as double?,
      pressure: map['pressure'] as int?,
      humidity: map['humidity'] as int?,
      dewPoint: map['dew_point'] as double?,
      uvi: map['uvi'] as double?,
      clouds: map['clouds'] as int?,
      visibility: map['visibility'] as int?,
      windSpeed: map['wind_speed'] as double?,
      windDeg: map['wind_deg'] as int?,
      windGust: map['wind_gust'] as double?,
      weather: List<Map<String, dynamic>>.from(map['weather'] as List)
          .map(WeatherDto.fromMap)
          .toList(),
      pop: map['pop'] as double?,
    );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'dt': dt,
        'temp': temp,
        'feels_like': feelsLike,
        'pressure': pressure,
        'humidity': humidity,
        'dew_point': dewPoint,
        'uvi': uvi,
        'clouds': clouds,
        'visibility': visibility,
        'wind_speed': windSpeed,
        'wind_deg': windDeg,
        'wind_gust': windGust,
        'weather':
            weather?.map((e) => WeatherDto.fromModel(e).toMap()).toList(),
        'pop': pop,
      };

  HourlyDto.fromModel(HourlyModel model)
      : super(
          dt: model.dt,
          temp: model.temp,
          feelsLike: model.feelsLike,
          pressure: model.pressure,
          humidity: model.humidity,
          dewPoint: model.dewPoint,
          uvi: model.uvi,
          clouds: model.clouds,
          visibility: model.visibility,
          windSpeed: model.windSpeed,
          windDeg: model.windDeg,
          windGust: model.windGust,
          weather: model.weather,
          pop: model.pop,
        );

  factory HourlyDto.fromJson(String source) =>
      HourlyDto.fromMap(json.decode(source) as Map<String, dynamic>);
  String toJson() => json.encode(toMap());
}
