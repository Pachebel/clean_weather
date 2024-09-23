import 'package:clean_weather/app/modules/core/domain/models/alert_model.dart';
import 'package:clean_weather/app/modules/core/domain/models/current_weather_model.dart';
import 'package:clean_weather/app/modules/core/domain/models/daily_model.dart';
import 'package:clean_weather/app/modules/core/domain/models/hourly_model.dart';
import 'package:clean_weather/app/modules/core/domain/models/minutely_model.dart';

class WeatherDataModel {
  final double? lat;
  final double? lon;
  final String? timezone;
  final int? timezoneOffset;
  final CurrentWeatherModel? current;
  final List<MinutelyModel>? minutely;
  final List<HourlyModel>? hourly;
  final List<DailyModel>? daily;
  final List<AlertModel>? alerts;

  WeatherDataModel({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.minutely,
    this.hourly,
    this.daily,
    this.alerts,
  });
}
