import 'dart:convert';

import 'package:clean_weather/app/modules/core/data/extensions/dto_parsing_extension.dart';
import 'package:clean_weather/app/modules/core/data/extensions/map_parsing_extension.dart';
import 'package:clean_weather/app/modules/core/data/source/dtos/weather_dto.dart';
import 'package:clean_weather/app/modules/core/domain/models/current_weather_model.dart';

class CurrentWeatherDto extends CurrentWeatherModel {
  CurrentWeatherDto({
    super.dt,
    super.sunrise,
    super.sunset,
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
  });

  factory CurrentWeatherDto.fromMap(Map<String, dynamic> map) {
    return CurrentWeatherDto(
      dt: map.parseInt('dt'),
      sunrise: map.parseInt('sunrise'),
      sunset: map.parseInt('sunset'),
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
    );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'dt': dt,
        'sunrise': sunrise,
        'sunset': sunset,
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
      };

  CurrentWeatherDto.fromModel(CurrentWeatherModel model)
      : super(
          dt: model.dt,
          sunrise: model.sunrise,
          sunset: model.sunset,
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
          weather: model.weather?.map((e) => e).toList(),
        );

  factory CurrentWeatherDto.fromJson(String source) =>
      CurrentWeatherDto.fromMap(json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());
}
