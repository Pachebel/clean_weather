import 'package:clean_weather/app/modules/core/data/api/api_response.dart';
import 'package:clean_weather/app/modules/core/data/source/dtos/weather_data_dto.dart';
import 'package:clean_weather/app/modules/core/data/source/weather_repository.dart';
import 'package:geolocator/geolocator.dart';

class GetWeekForecastUseCase {
  final WeatherRepository repository;

  GetWeekForecastUseCase(this.repository);

  Stream<ApiResponse<WeatherDataDto>> call(Position position) async* {
    yield* repository.getWeekForecast(position);
  }
}
