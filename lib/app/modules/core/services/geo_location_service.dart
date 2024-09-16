import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

abstract class IGeoLocationService {
  Future<Position> getCurrentPosition();
  Future<LocationPermission> requestPermission();
  Future<bool> openAppSettings();
  Future<bool> openLocationSettings();
}

class GeoLocationService implements IGeoLocationService {
  final permission = ValueNotifier<LocationPermission?>(null);

  @override
  Future<Position> getCurrentPosition() async =>
      Geolocator.getCurrentPosition();

  @override
  Future<LocationPermission> requestPermission() async =>
      permission.value = await Geolocator.requestPermission();

  @override
  Future<bool> openAppSettings() => Geolocator.openAppSettings();

  @override
  Future<bool> openLocationSettings() => Geolocator.openLocationSettings();
}
