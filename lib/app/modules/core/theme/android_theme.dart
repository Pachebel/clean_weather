// ignore_for_file: prefer_constructors_over_static_methods
import 'package:clean_weather/app/modules/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AndroidTheme {
  AndroidTheme._();

  static AndroidTheme? _instance;

  static AndroidTheme get instance => _instance ??= AndroidTheme._();

  void init(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    _theme.value = _base(brightness);
  }

  void changeTheme() {
    final brightness = _theme.value.brightness == Brightness.light
        ? Brightness.dark
        : Brightness.light;
    _theme.value = _base(brightness);
  }

  final _theme = ValueNotifier<ThemeData>(ThemeData());
  ValueNotifier<ThemeData> get theme => _theme;

  ThemeData _base(Brightness brightness) => ThemeData(
        primaryColor: primaryColor,
        brightness: brightness,
      );
}
