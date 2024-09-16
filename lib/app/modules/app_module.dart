import 'package:clean_weather/app/modules/core/services/geo_location_service.dart';
import 'package:clean_weather/app/modules/core/services/local_storage_service.dart';
import 'package:clean_weather/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i
      ..addLazySingleton<LocalStorage>(LocalStorageService.new)
      ..addLazySingleton<GeoLocationService>(GeoLocationService.new);
  }

  @override
  void routes(RouteManager r) {
    r.module('/', module: HomeModule());
    // TODO(pachebel): implement 404 page
    // ..wildcard(child: (context) => const WildcardRoutePage());
  }
}
