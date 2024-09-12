import 'package:clean_weather/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.module('/', module: HomeModule());
    // TODO: implement 404 page
    // ..wildcard(child: (context) => const WildcardRoutePage());
  }
}
