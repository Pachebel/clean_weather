import 'package:clean_weather/app/modules/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AndroidTheme {
  ThemeData theme(Brightness brightness) =>
      brightness == Brightness.light ? lightTheme : darkTheme;

  ThemeData get lightTheme => _base(Brightness.light);
  ThemeData get darkTheme => _base(Brightness.dark);

  ThemeData _base(Brightness brightness) => ThemeData(
        colorSchemeSeed: primaryColor,
        brightness: brightness,
      );
}
