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
      pop: map['pop'] as double?,
    );
  }

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    data['dt'] = dt;
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
    data['weather'] = weather?.map((v) => v.toMap()).toList();
    data['pop'] = pop;
    return data;
  }

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
          weather: model.weather?.map(WeatherDto.fromWeather).toList(),
          pop: model.pop,
        );

  factory HourlyDto.fromJson(String source) =>
      HourlyDto.fromMap(json.decode(source) as Map<String, dynamic>);
  String toJson() => json.encode(toMap());
}
