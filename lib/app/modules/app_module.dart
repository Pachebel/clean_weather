import 'package:clean_weather/app/modules/core/data/api/api.dart';
import 'package:clean_weather/app/modules/core/data/services/geo_location_service.dart';
import 'package:clean_weather/app/modules/core/data/services/local_storage_service.dart';
import 'package:clean_weather/app/modules/permission/permission_module.dart';
import 'package:clean_weather/app/modules/start/start_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    // global services
    i
      ..addLazySingleton<LocalStorage>(LocalStorageImpl.new)
      ..addLazySingleton<ApiRequest>(ApiRequestImpl.new)
      ..addLazySingleton<GeoLocationService>(GeoLocationServiceImpl.new);
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
