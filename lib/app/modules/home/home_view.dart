import 'package:clean_weather/app/modules/core/services/geo_location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with WidgetsBindingObserver {
  final localizationService = Modular.get<GeoLocationService>();

  @override
  Widget build(BuildContext context) {
    final geoService = GeoLocationService();
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: geoService.permission,
        builder: (_, value, __) {
          switch (value) {
            case null:
              return const Center(child: CircularProgressIndicator.adaptive());

            case LocationPermission.deniedForever:
              return AlertDialog.adaptive(
                title: const Text('Location Access Required'),
                content: const Text(
                  'Please enable location access to use this feature',
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () async {
                      await geoService.openAppSettings();
                      await geoService.requestPermission();
                    },
                    child: const Text('Open Settings'),
                  ),
                  ElevatedButton(
                    onPressed: geoService.openLocationSettings,
                    child: const Text('Open Location Settings'),
                  ),
                ],
              );
            case LocationPermission.denied:
              return const Center(
                child: Text('LocationPermission.deniedForever'),
              );
            case LocationPermission.whileInUse:
              return Center(
                child: AlertDialog(
                  title: const Text('LocationPermission.whileInUse'),
                  actions: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Open Settings'),
                    ),
                    ElevatedButton(
                      onPressed: geoService.openLocationSettings,
                      child: const Text('Open Location Settings'),
                    ),
                  ],
                ),
              );
            case LocationPermission.always:
              return const Center(child: Text('LocationPermission.always'));

            case LocationPermission.unableToDetermine:
              return const Center(
                child: Text('LocationPermission.unableToDetermine'),
              );
          }
        },
      ),
    );
  }
}
