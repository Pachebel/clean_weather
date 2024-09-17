import 'package:clean_weather/app/modules/core/data/services/geo_location_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';

class PermissionViewModel {
  final locationService = Modular.get<GeoLocationService>();

  ValueNotifier<LocationPermission?> get locationPermission =>
      locationService.permission;

  Future<LocationPermission> requestPermission() async =>
      locationService.requestPermission();

  Future<bool> openLocationSettings() => locationService.openLocationSettings();
  Future<bool> openAppSettings() => locationService.openAppSettings();
}
