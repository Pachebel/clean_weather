import 'package:clean_weather/app/modules/core/services/geolocation/geo_location_modal_service.dart';
import 'package:clean_weather/app/modules/core/services/geolocation/geo_location_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class IOSGeolocationModal extends IGeoLocationModalService {
  const IOSGeolocationModal(this.service, {super.key});

  final GeoLocationService service;

  @override
  State<IOSGeolocationModal> createState() => _IOSGeolocationModalState();
}

class _IOSGeolocationModalState extends State<IOSGeolocationModal>
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
    final service = Modular.get<GeoLocationService>()..requestPermission();

    return CupertinoAlertDialog(
      title: const Text('Location Access Required'),
      content: const Text(
        'Please enable location access to use this feature',
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: service.openAppSettings,
          child: const Text('Open Settings'),
        ),
        CupertinoDialogAction(
          onPressed: service.openLocationSettings,
          child: const Text('Open Location Settings'),
        ),
      ],
    );
  }
}
