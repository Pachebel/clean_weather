import 'package:clean_weather/app/modules/core/data/config/consts/storage_keys.dart';
import 'package:clean_weather/app/modules/core/data/services/local_storage_service.dart';
import 'package:clean_weather/app/modules/core/data/source/dtos/weather_data_dto.dart';
import 'package:clean_weather/app/modules/core/data/source/weather_repository.dart';
import 'package:geolocator/geolocator.dart';

class LocalWeatherRepositoryImpl implements WeatherRepository {
  LocalWeatherRepositoryImpl(this._storage);
  final LocalStorage _storage;

  @override
  Future<WeatherDataDto> getWeekForecast(Position position) async {
    final today = DateTime.now();
    final data = await _storage.read(StorageKeys.weekForecastKey(today));
    if (data != null) return WeatherDataDto.fromJson(data);
    throw const FormatException();
  }

  Future<void> saveWeekForecast(WeatherDataDto response) async {
    final today = DateTime.now();
    await _storage.write(StorageKeys.weekForecastKey(today), response.toJson());
  }

  @override
  Future<WeatherDataDto> getDayForecast(Position position) {
    throw UnimplementedError();
  }
}
