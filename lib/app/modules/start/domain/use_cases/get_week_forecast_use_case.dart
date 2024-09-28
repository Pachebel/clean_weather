import 'package:clean_weather/app/modules/core/data/source/weather_repository.dart';
import 'package:clean_weather/app/modules/core/domain/models/weather_data_model.dart';
import 'package:geolocator/geolocator.dart';

class GetWeekForecastUseCase {
  final WeatherRepository repository;

  GetWeekForecastUseCase(this.repository);

  Future<WeatherDataModel> call(Position position) async =>
      repository.getWeekForecast(position);
}
