import 'package:clean_weather/app/modules/core/data/services/geo_location_service.dart';
import 'package:clean_weather/app/modules/core/data/source/weather_repository.dart';
import 'package:clean_weather/app/modules/core/domain/models/weather_data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StartViewModel {
  StartViewModel() {
    _getWeekForecast();
  }
  final weatherRepository = Modular.get<WeatherRepository>();
  final positionService = Modular.get<GeoLocationService>();

  final ValueNotifier<WeatherDataModel?> _weekForecast = ValueNotifier(null);

  ValueNotifier<WeatherDataModel?> get weekForecast => _weekForecast;

  Future<void> _getWeekForecast() async {
    final position = positionService.position.value ??
        await positionService.getCurrentPosition();
    final forecast = await weatherRepository.getWeekForecast(position);
    _weekForecast.value = forecast;
  }
}
