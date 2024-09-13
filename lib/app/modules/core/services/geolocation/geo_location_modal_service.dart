import 'dart:io';

import 'package:clean_weather/app/modules/core/services/geolocation/geo_location_service.dart';
import 'package:clean_weather/app/modules/core/services/geolocation/widgets/android_geo_location_modal.dart';
import 'package:clean_weather/app/modules/core/services/geolocation/widgets/ios_geo_location_modal.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class IGeoLocationModalService extends StatefulWidget {
  const IGeoLocationModalService({super.key});

  @override
  State<IGeoLocationModalService> createState();
}

class GeoLocationModalFactory {
  IGeoLocationModalService buildGeoLocationModal() {
    final service = Modular.get<GeoLocationService>();

    if (Platform.isAndroid) return AndroidGeolocationModal(service);
    if (Platform.isIOS) return IOSGeolocationModal(service);
    throw UnsupportedError('Unsupported platform');
  }
}
