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
      dt: int.tryParse(map['dt'].toString()),
      sunrise: int.tryParse(map['sunrise'].toString()),
      sunset: int.tryParse(map['sunset'].toString()),
      temp: double.tryParse(map['temp'].toString()),
      feelsLike: double.tryParse(map['feels_like'].toString()),
      pressure: int.tryParse(map['pressure'].toString()),
      humidity: int.tryParse(map['humidity'].toString()),
      dewPoint: double.tryParse(map['dew_point'].toString()),
      uvi: double.tryParse(map['uvi'].toString()),
      clouds: int.tryParse(map['clouds'].toString()),
      visibility: int.tryParse(map['visibility'].toString()),
      windSpeed: double.tryParse(map['wind_speed'].toString()),
      windDeg: int.tryParse(map['wind_deg'].toString()),
      windGust: double.tryParse(map['wind_gust'].toString()),
      weather: map['weather'] != null
          ? List<Map<String, dynamic>>.from(map['weather'] as List)
              .map(WeatherDto.fromMap)
              .toList()
          : null,
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
