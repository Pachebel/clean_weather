import 'package:clean_weather/app/modules/core/services/geolocation/geo_location_service.dart';
import 'package:clean_weather/app/modules/core/theme/ios_theme.dart';
import 'package:clean_weather/app/modules/home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class IOSHomeView extends IHomeView {
  const IOSHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final factory = GeoLocationModalFactory();
    final appTheme = IOSTheme.instance;
    final service = GeoLocationService();
    return CupertinoPageScaffold(
      child: ValueListenableBuilder(
        valueListenable: service.permission,
        builder:
            (BuildContext context, LocationPermission? value, Widget? child) {
          switch (value) {
            case null:
              return Center(
                child: CupertinoButton(
                  onPressed: appTheme.changeTheme,
                  child: const Text('IOA'),
                ),
              );
            case LocationPermission.deniedForever:
              return CupertinoAlertDialog(
                title: const Text('Location Access Required'),
                content: const Text(
                  'Please enable location access to use this feature',
                ),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () async {
                      await service.openAppSettings();
                      await service.requestPermission();
                    },
                    child: const Text('Open Settings'),
                  ),
                  CupertinoDialogAction(
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
                child: CupertinoAlertDialog(
                  title: const Text('LocationPermission.whileInUse'),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () {},
                      child: const Text('Open Settings'),
                    ),
                    CupertinoDialogAction(
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
