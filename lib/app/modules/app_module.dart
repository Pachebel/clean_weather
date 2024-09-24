import 'package:clean_weather/app/modules/core/data/api/api.dart';
import 'package:clean_weather/app/modules/core/data/services/geo_location_service.dart';
import 'package:clean_weather/app/modules/core/data/services/local_storage_service.dart';
import 'package:clean_weather/app/modules/core/data/source/local/local_weather_repository.dart';
import 'package:clean_weather/app/modules/core/data/source/remote/remote_weather_repository.dart';
import 'package:clean_weather/app/modules/core/data/source/weather_repository.dart';
import 'package:clean_weather/app/modules/permission/permission_module.dart';
import 'package:clean_weather/app/modules/start/start_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    // global services
    i
      ..addInstance(Dio())
      ..addLazySingleton<LocalStorage>(LocalStorageImpl.new)
      ..addLazySingleton<ApiRequest>(ApiRequestImpl.new)
      ..addLazySingleton<WeatherApiRequest>(WeatherApiRequest.new)
      ..addLazySingleton<GeoLocationService>(GeoLocationServiceImpl.new)
      ..addLazySingleton<RemoteWeatherRepositoryImpl>(
        RemoteWeatherRepositoryImpl.new,
      )
      ..addLazySingleton<LocalWeatherRepositoryImpl>(
        LocalWeatherRepositoryImpl.new,
      )
      ..addLazySingleton<WeatherRepository>(
        WeatherRepositoryImpl.new,
      );
  }

  @override
  void routes(RouteManager r) {
    r
      ..module('/', module: PermissionModule())
      ..module('/start', module: StartModule());
    // TODO(pachebel): implement 404 page
    // ..wildcard(child: (context) => const WildcardRoutePage());
  }
}
