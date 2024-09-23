import 'package:clean_weather/app/modules/core/data/api/api.dart';
import 'package:clean_weather/app/modules/core/data/source/local/local_weather_repository.dart';
import 'package:clean_weather/app/modules/core/data/source/remote/remote_weather_repository.dart';
import 'package:clean_weather/app/modules/core/domain/models/weather_data_model.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

class WeatherApiRequest extends ApiRequestImpl {
  WeatherApiRequest(super.dio) {
    dio.options = BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5',
    );
  }
}

abstract interface class WeatherRepository {
  Future<WeatherDataModel> getWeekForecast(Position position);
  Future<WeatherDataModel> getDayForecast(Position position);
}

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl(this.remote, this.local);
  final RemoteWeatherRepositoryImpl remote;
  final LocalWeatherRepositoryImpl local;

  @override
  Future<WeatherDataModel> getWeekForecast(Position position) async {
    try {
      final cache = await local.getWeekForecast(position);
    } on FormatException catch (_) {
      final response = await remote.getWeekForecast(position);
      await local.saveWeekForecast(response);
      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<WeatherDataModel> getDayForecast(Position position) {
    throw UnimplementedError();
  }
}
