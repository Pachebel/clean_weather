import 'dart:convert';

import 'package:clean_weather/app/modules/core/data/extensions/dto_parsing_extension.dart';
import 'package:clean_weather/app/modules/core/data/extensions/map_parsing_extension.dart';
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
      dt: map.parseInt('dt'),
      temp: map.parseDouble('temp'),
      feelsLike: map.parseDouble('feels_like'),
      pressure: map.parseInt('pressure'),
      humidity: map.parseInt('humidity'),
      dewPoint: map.parseDouble('dew_point'),
      uvi: map.parseDouble('uvi'),
      clouds: map.parseInt('clouds'),
      visibility: map.parseInt('visibility'),
      windSpeed: map.parseDouble('wind_speed'),
      windDeg: map.parseInt('wind_deg'),
      windGust: map.parseDouble('wind_gust'),
      weather: map.parseWeatherList('weather'),
      pop: map.parseDouble('pop'),
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
