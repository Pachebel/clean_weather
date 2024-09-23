import 'package:clean_weather/app/modules/core/data/source/weather_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StartViewModel {
  final repository = Modular.get<WeatherRepository>();
}
