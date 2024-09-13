import 'package:clean_weather/app/modules/core/services/geolocation/geo_location_modal_service.dart';
import 'package:clean_weather/app/modules/core/services/geolocation/geo_location_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class AndroidGeolocationModal extends IGeoLocationModalService {
  const AndroidGeolocationModal(this.service, {super.key});

  final GeoLocationService service;

  @override
  State<AndroidGeolocationModal> createState() =>
      _AndroidGeolocationModalState();
}

class _AndroidGeolocationModalState extends State<AndroidGeolocationModal>
    with WidgetsBindingObserver {
  final bind = WidgetsBinding.instance;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) => setState(() {});

  @override
  void initState() {
    super.initState();
    bind.addObserver(this);
  }

  @override
  void dispose() {
    bind.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.service.permission,
      child: const SizedBox(),
      builder:
          (BuildContext context, LocationPermission? value, Widget? child) {
        switch (value) {
          case LocationPermission.deniedForever:
            return CupertinoAlertDialog(
              title: const Text('Location Access Required'),
              content: const Text(
                'Please enable location access to use this feature',
              ),
              actions: [
                CupertinoDialogAction(
                  onPressed: () async {
                    await widget.service.openAppSettings();
                    await widget.service.requestPermission();
                  },
                  child: const Text('Open Settings'),
                ),
                CupertinoDialogAction(
                  onPressed: widget.service.openLocationSettings,
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
                    onPressed: widget.service.openLocationSettings,
                    child: const Text('Open Location Settings'),
                  ),
                ],
              ),
            );
          case LocationPermission.always:
            return const Center(child: Text('LocationPermission.always'));
          case null:
            return const Center(child: Text('LocationPermission.null'));
          case LocationPermission.unableToDetermine:
            return const Center(
              child: Text('LocationPermission.unableToDetermine'),
            );
        }
      },
    );
  }
}
