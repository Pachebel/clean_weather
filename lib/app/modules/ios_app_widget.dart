import 'package:clean_weather/app/modules/app_factory.dart';
import 'package:clean_weather/app/modules/core/theme/ios_theme.dart';
import 'package:flutter/cupertino.dart';

class IOSApp extends PlatformApp {
  IOSApp(this.reouterConfig, {super.key});
  final RouterConfig<Object> reouterConfig;
  final appValueNotifier = IOSTheme.instance;

  @override
  IOSAppState createState() => IOSAppState();
}

class IOSAppState extends State<IOSApp> with WidgetsBindingObserver {
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
      builder: (_, CupertinoThemeData value, __) {
        return CupertinoApp.router(
          key: widget.key,
          theme: value,
          routerConfig: widget.reouterConfig,
        );
      },
    );
  }
}
