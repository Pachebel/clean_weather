import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PlatformApp {
  Widget createApp();
}

class AppFactory {
  PlatformApp createPlatformApp(RouterConfig<Object> reouterConfig) {
    if (Platform.isAndroid) return AndroidApp(reouterConfig);
    if (Platform.isIOS) return IOSApp(reouterConfig);

    throw UnsupportedError('Unsupported platform');
  }
}

// Android implementation
class AndroidApp implements PlatformApp {
  AndroidApp(this.reouterConfig);
  final RouterConfig<Object> reouterConfig;

  @override
  Widget createApp() => MaterialApp.router(routerConfig: reouterConfig);
}

// iOS implementation
class IOSApp implements PlatformApp {
  IOSApp(this.reouterConfig);
  final RouterConfig<Object> reouterConfig;
  @override
  Widget createApp() => CupertinoApp.router(routerConfig: reouterConfig);
}
