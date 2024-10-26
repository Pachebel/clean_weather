import 'package:clean_weather/app/modules/core/data/services/geo_location_service.dart';
import 'package:clean_weather/app/modules/core/data/source/weather_repository.dart';
import 'package:clean_weather/app/modules/core/domain/models/weather_data_model.dart';
import 'package:clean_weather/app/modules/start/domain/use_cases/get_current_position_use_case.dart';
import 'package:clean_weather/app/modules/start/domain/use_cases/get_week_forecast_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StartViewModel {
  final weatherRepository = Modular.get<WeatherRepository>();
  final positionService = Modular.get<GeoLocationService>();

  final ValueNotifier<WeatherDataModel?> _weekForecast = ValueNotifier(null);

  ValueNotifier<WeatherDataModel?> get weekForecast => _weekForecast;

  Stream<void> getWeekForecast() async* {
    final position = await GetCurrentPositionUseCase(positionService).call();

    yield* GetWeekForecastUseCase(weatherRepository).call(position);
  }
}
