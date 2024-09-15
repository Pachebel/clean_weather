// ignore_for_file: prefer_constructors_over_static_methods

import 'package:clean_weather/app/modules/core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';

class IOSTheme {
  IOSTheme._();
  static IOSTheme? _instance;

  static IOSTheme get instance => _instance ??= IOSTheme._();

  void init(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    _theme.value = base(brightness);
  }

  void changeTheme() {
    final brightness = _theme.value.brightness == Brightness.light
        ? Brightness.dark
        : Brightness.light;
    _theme.value = base(brightness);
  }

  final _theme = ValueNotifier<CupertinoThemeData>(const CupertinoThemeData());
  ValueNotifier<CupertinoThemeData> get theme => _theme;

  CupertinoThemeData base(Brightness brightness) => CupertinoThemeData(
        applyThemeToAll: true,
        primaryColor: primaryColor,
        brightness: brightness,
      );
}
