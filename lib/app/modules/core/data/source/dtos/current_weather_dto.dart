import 'dart:convert';

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
      dt: map['dt'] as int?,
      sunrise: map['sunrise'] as int?,
      sunset: map['sunset'] as int?,
      temp: map['temp'] as double?,
      feelsLike: map['feelsLike'] as double?,
      pressure: map['pressure'] as int?,
      humidity: map['humidity'] as int?,
      dewPoint: map['dewPoint'] as double?,
      uvi: map['uvi'] as double?,
      clouds: map['clouds'] as int?,
      visibility: map['visibility'] as int?,
      windSpeed: map['windSpeed'] as double?,
      windDeg: map['windDeg'] as int?,
      windGust: map['windGust'] as double?,
      weather: List<Map<String, dynamic>>.from(map['weather'] as List)
          .map(WeatherDto.fromMap)
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    data['dt'] = dt;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['temp'] = temp;
    data['feelsLike'] = feelsLike;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['dewPoint'] = dewPoint;
    data['uvi'] = uvi;
    data['clouds'] = clouds;
    data['visibility'] = visibility;
    data['windSpeed'] = windSpeed;
    data['windDeg'] = windDeg;
    data['windGust'] = windGust;
    data['weather'] =
        weather?.map((v) => WeatherDto.fromModel(v).toMap()).toList();
    return data;
  }

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
