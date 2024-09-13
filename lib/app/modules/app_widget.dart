import 'dart:io';

import 'package:clean_weather/app/modules/core/theme/android_theme.dart';
import 'package:clean_weather/app/modules/core/theme/ios_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PlatformApp {
  Widget createApp();
}

class AppFactory {
  PlatformApp createPlatformApp(
    RouterConfig<Object> reouterConfig,
    Brightness brightness,
  ) {
    if (Platform.isAndroid) return AndroidApp(reouterConfig, brightness);
    if (Platform.isIOS) return IOSApp(reouterConfig, brightness);

    throw UnsupportedError('Unsupported platform');
  }
}

// Android implementation
class AndroidApp implements PlatformApp {
  AndroidApp(this.reouterConfig, this.brightness);
  final RouterConfig<Object> reouterConfig;
  final Brightness brightness;

  final appTheme = AndroidTheme();

  @override
  Widget createApp() => MaterialApp.router(
        routerConfig: reouterConfig,
        theme: appTheme.theme(brightness),
      );
}

// iOS implementation
class IOSApp implements PlatformApp {
  IOSApp(this.reouterConfig, this.brightness);
  final RouterConfig<Object> reouterConfig;
  final Brightness brightness;

  final appValueNotifier = IOSTheme();

  @override
  Widget createApp() => ValueListenableBuilder(
        valueListenable: appValueNotifier.theme,
        builder: (_, value, __) => CupertinoApp.router(
          routerConfig: reouterConfig,
          theme: value,
        ),
      );
}
