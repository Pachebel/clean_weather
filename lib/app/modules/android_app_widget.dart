import 'package:clean_weather/app/modules/app_factory.dart';
import 'package:clean_weather/app/modules/core/theme/android_theme.dart';
import 'package:flutter/material.dart';

class AndroidApp extends PlatformApp {
  AndroidApp(this.routerConfig, {super.key});
  final RouterConfig<Object> routerConfig;
  final appValueNotifier = AndroidTheme.instance;

  @override
  AndroidAppState createState() => AndroidAppState();
}

class AndroidAppState extends State<AndroidApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.appValueNotifier.init(context);
    });

    super.initState();
  }

  @override
  void dispose() {
    widget.appValueNotifier.theme.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.appValueNotifier.theme,
      builder: (_, ThemeData value, __) => MaterialApp.router(
        key: widget.key,
        theme: value,
        routerConfig: widget.routerConfig,
      ),
    );
  }
}
