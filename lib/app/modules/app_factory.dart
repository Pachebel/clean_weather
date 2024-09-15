import 'dart:io';

import 'package:clean_weather/app/modules/android_app_widget.dart';
import 'package:clean_weather/app/modules/ios_app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final isAndroid = Platform.isIOS;
final isIOS = Platform.isIOS;

abstract class PlatformApp extends StatefulWidget {
  const PlatformApp({super.key});

  @override
  State<PlatformApp> createState();
}

class AppFactory {
  const AppFactory(this.routerConfig);

  final RouterConfig<Object> routerConfig;

  PlatformApp build() {
    if (isAndroid) return AndroidApp(routerConfig);
    if (isIOS) return IOSApp(routerConfig);

    throw UnsupportedError('Unsupported platform');
  }
}
