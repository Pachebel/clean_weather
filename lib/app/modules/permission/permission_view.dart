import 'package:clean_weather/app/modules/permission/permission_view_model.dart';
import 'package:clean_weather/app/modules/permission/widgets/permission_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';

class PermissionView extends StatefulWidget {
  const PermissionView({super.key});

  @override
  State<PermissionView> createState() => _PermissionViewState();
}

class _PermissionViewState extends State<PermissionView>
    with WidgetsBindingObserver {
  final viewModel = Modular.get<PermissionViewModel>();

  @override
  void initState() {
    viewModel.checkPermission();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      viewModel.checkPermission();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    late PermissionPageWidget currentWidget;

    Widget buildLocationPermission() => currentWidget = PermissionPageWidget(
          icon: Icons.location_on_rounded,
          title: 'Turn on location?',
          description:
              'Get the most accurate weather forecast for your location '
              'in a single tap',
          primaryText: 'Turn on location',
          primaryOnTap: viewModel.requestPermission,
          secondaryText: 'Not now',
          secondaryOnTap: viewModel.pushToStart,
        );

    Widget buildLocationDenied() => currentWidget = PermissionPageWidget(
          icon: Icons.location_off_rounded,
          title: 'Location is turned off',
          description:
              'Turn on location to get the most accurate weather forecast '
              'for your location',
          primaryText: 'Turn on location',
          primaryOnTap: viewModel.openLocationSettings,
          secondaryText: 'Open settings',
          secondaryOnTap: viewModel.openAppSettings,
        );

    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: viewModel.locationPermission,
        builder: (_, value, __) {
          switch (value) {
            case null || LocationPermission.unableToDetermine:
              return buildLocationPermission();

            case LocationPermission.deniedForever || LocationPermission.denied:
              return buildLocationDenied();

            case LocationPermission.whileInUse || LocationPermission.always:
              viewModel.pushToStart();
              return currentWidget;
          }
        },
      ),
    );
  }
}
