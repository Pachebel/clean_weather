import 'package:clean_weather/app/modules/start/start_view.dart';
import 'package:clean_weather/app/modules/start/start_view_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StartModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<StartViewModel>(StartViewModel.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const StartView());
  }
}
