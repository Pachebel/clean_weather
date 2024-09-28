import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

abstract interface class GeoLocationService {
  Future<Position> getCurrentPosition();
  Future<LocationPermission> requestPermission();
  Future<LocationPermission> checkPermission();
  Future<bool> openAppSettings();
  Future<bool> openLocationSettings();
  ValueNotifier<LocationPermission?> get permission;
  ValueNotifier<Position?> get position;
}

class GeoLocationServiceImpl implements GeoLocationService {
  @override
  final permission = ValueNotifier<LocationPermission?>(null);

  @override
  final position = ValueNotifier<Position?>(null);

  @override
  Future<Position> getCurrentPosition() async =>
      position.value = await Geolocator.getCurrentPosition();

  @override
  Future<LocationPermission> requestPermission() async =>
      permission.value = await Geolocator.requestPermission();

  @override
  Future<bool> openAppSettings() => Geolocator.openAppSettings();

  @override
  Future<bool> openLocationSettings() => Geolocator.openLocationSettings();

  @override
  Future<LocationPermission> checkPermission() async =>
      Geolocator.checkPermission();
}
