import 'package:clean_weather/app/modules/core/data/api/api.dart';
import 'package:clean_weather/app/modules/core/data/config/consts/weather_api.dart';
import 'package:clean_weather/app/modules/core/data/source/local/local_weather_repository.dart';
import 'package:clean_weather/app/modules/core/data/source/remote/remote_weather_repository.dart';
import 'package:clean_weather/app/modules/core/domain/models/weather_data_model.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

class WeatherApiRequest extends ApiRequestImpl {
  WeatherApiRequest() {
    dio.options = BaseOptions(
      baseUrl: WeatherApi.baseUrl,
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
      return await local.getWeekForecast(position);
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
