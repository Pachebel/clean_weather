import 'package:clean_weather/app/modules/app_module.dart';
import 'package:clean_weather/app/modules/app_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final factory = AppFactory();
  final reouterConfig = Modular.routerConfig;
  final brightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  return runApp(
    ModularApp(
      module: AppModule(),
      child: factory.createPlatformApp(reouterConfig, brightness).createApp(),
    ),
  );
}
