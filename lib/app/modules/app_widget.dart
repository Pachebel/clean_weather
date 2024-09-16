import 'package:clean_weather/app/modules/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  AppWidgetState createState() => AppWidgetState();
}

class AppWidgetState extends State<AppWidget> with WidgetsBindingObserver {
  final theme = AppTheme.instance;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      theme.init(context);
    });

    super.initState();
  }

  @override
  void dispose() {
    theme.theme.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      theme.init(context);
    });
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: theme.theme,
      builder: (_, ThemeData value, __) => MaterialApp.router(
        theme: value,
        routerConfig: Modular.routerConfig,
      ),
    );
  }
}
