import 'package:clean_weather/app/modules/app_module.dart';
import 'package:clean_weather/app/modules/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final appFactory = AppFactory();
  final platformApp = appFactory.createPlatformApp(Modular.routerConfig);

  return runApp(
    ModularApp(
      module: AppModule(),
      child: platformApp.createApp(),
    ),
  );
}
