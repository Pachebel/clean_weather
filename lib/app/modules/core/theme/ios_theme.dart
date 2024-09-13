import 'package:clean_weather/app/modules/core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';

class IOSTheme {
  IOSTheme() {
    _init();
  }

  void _init() => theme.value = lightTheme;

  final theme = ValueNotifier<CupertinoThemeData>(const CupertinoThemeData());

  CupertinoThemeData get lightTheme => _base(Brightness.light);
  CupertinoThemeData get darkTheme => _base(Brightness.dark);

  CupertinoThemeData _base(Brightness brightness) => CupertinoThemeData(
        applyThemeToAll: true,
        primaryColor: primaryColor,
        brightness: brightness,
      );

  CupertinoThemeData changeTheme(Brightness brightness) =>
      theme.value = _base(brightness);
}
