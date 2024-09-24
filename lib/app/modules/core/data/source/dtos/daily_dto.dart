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
      dt: int.tryParse(map['dt'].toString()),
      sunrise: int.tryParse(map['sunrise'].toString()),
      sunset: int.tryParse(map['sunset'].toString()),
      moonrise: int.tryParse(map['moonrise'].toString()),
      moonset: int.tryParse(map['moonset'].toString()),
      moonPhase: double.tryParse(map['moon_phase'].toString()),
      summary: map['summary'] as String?,
      temp: map['temp'] != null
          ? TempDto.fromMap(map['temp'] as Map<String, dynamic>)
          : null,
      feelsLike: map['feels_like'] != null
          ? FeelsLikeDto.fromMap(map['feels_like'] as Map<String, dynamic>)
          : null,
      pressure: int.tryParse(map['pressure'].toString()),
      humidity: int.tryParse(map['humidity'].toString()),
      dewPoint: double.tryParse(map['dew_point'].toString()),
      windSpeed: double.tryParse(map['wind_speed'].toString()),
      windDeg: map['wind_deg'] as int?,
      windGust: double.tryParse(map['wind_gust'].toString()),
      weather: map['weather'] != null
          ? List<Map<String, dynamic>>.from(map['weather'] as List)
              .map(WeatherDto.fromMap)
              .toList()
          : null,
      clouds: int.tryParse(map['clouds'].toString()),
      pop: double.tryParse(map['pop'].toString()),
      rain: double.tryParse(map['rain'].toString()),
      uvi: double.tryParse(map['uvi'].toString()),
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
