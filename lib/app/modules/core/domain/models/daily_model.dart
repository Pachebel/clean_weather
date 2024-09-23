import 'package:clean_weather/app/modules/core/domain/models/feels_like_model.dart';
import 'package:clean_weather/app/modules/core/domain/models/temp_model.dart';
import 'package:clean_weather/app/modules/core/domain/models/weather_model.dart';

class DailyModel {
  final int? dt;
  final int? sunrise;
  final int? sunset;
  final int? moonrise;
  final int? moonset;
  final double? moonPhase;
  final String? summary;
  final TempModel? temp;
  final FeelsLikeModel? feelsLike;
  final int? pressure;
  final int? humidity;
  final double? dewPoint;
  final double? windSpeed;
  final int? windDeg;
  final double? windGust;
  final List<WeatherModel>? weather;
  final int? clouds;
  final double? pop;
  final double? rain;
  final double? uvi;

  DailyModel({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.summary,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.rain,
    this.uvi,
  });
}
