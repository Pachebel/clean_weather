import 'package:clean_weather/app/modules/core/services/geolocation/geo_location_service.dart';
import 'package:clean_weather/app/modules/core/theme/android_theme.dart';
import 'package:clean_weather/app/modules/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class AndroidHomeView extends IHomeView {
  const AndroidHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AndroidTheme.instance;
    final service = GeoLocationService();
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: service.permission,
        builder:
            (BuildContext context, LocationPermission? value, Widget? child) {
          switch (value) {
            case null:
              return Center(
                child: ElevatedButton(
                  onPressed: appTheme.changeTheme,
                  child: const Text('IOA'),
                ),
              );
            case LocationPermission.deniedForever:
              return AlertDialog(
                title: const Text('Location Access Required'),
                content: const Text(
                  'Please enable location access to use this feature',
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () async {
                      await service.openAppSettings();
                      await service.requestPermission();
                    },
                    child: const Text('Open Settings'),
                  ),
                  ElevatedButton(
                    onPressed: service.openLocationSettings,
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
                      onPressed: service.openLocationSettings,
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
