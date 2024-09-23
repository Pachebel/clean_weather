import 'package:clean_weather/app/modules/core/data/config/consts/weather_key.dart';
import 'package:clean_weather/app/modules/core/data/source/dtos/weather_data_dto.dart';
import 'package:clean_weather/app/modules/core/data/source/weather_repository.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

class RemoteWeatherRepositoryImpl implements WeatherRepository {
  RemoteWeatherRepositoryImpl(this.api);
  final WeatherApiRequest api;

  @override
  Future<WeatherDataDto> getWeekForecast(Position position) async {
    final lat = position.latitude;
    final lon = position.longitude;

    try {
      final response = await api.get<WeatherDataDto>(
        url: '/onecall',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'exclude': 'current,minutely,hourly,alerts',
          'appid': WeatherApiKey.apiKey,
        },
      );

      return response!;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<WeatherDataDto> getDayForecast(Position position) {
    throw UnimplementedError();
  }
}
