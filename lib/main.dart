import 'package:clean_weather/app/modules/app_factory.dart';
import 'package:clean_weather/app/modules/app_module.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final reouterConfig = Modular.routerConfig;

  final factory = AppFactory(reouterConfig);
  return runApp(
    ModularApp(
      module: AppModule(),
      child: factory.build(),
    ),
  );
}
