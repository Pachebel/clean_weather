// ignore_for_file: prefer_constructors_over_static_methods
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  Color get primaryColor => Colors.red;

  static AppTheme? _instance;

  static AppTheme get instance => _instance ??= AppTheme._();

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
  ValueNotifier<ThemeData> get appTheme => _theme;

  ThemeData _base(Brightness brightness) => ThemeData(
        colorSchemeSeed: primaryColor,
        brightness: brightness,
      );
}
