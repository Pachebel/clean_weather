import 'package:clean_weather/app/modules/core/data/services/geo_location_service.dart';
import 'package:clean_weather/app/modules/permission/domain/use_cases/check_permission_use_case.dart';
import 'package:clean_weather/app/modules/permission/domain/use_cases/request_permission_use_case.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';

class PermissionViewModel {
  final locationService = Modular.get<GeoLocationService>();

  ValueNotifier<LocationPermission?> get locationPermission =>
      _locationPermission;

  final _locationPermission = ValueNotifier<LocationPermission?>(null);

  Future<LocationPermission> requestPermission() async =>
      RequestPermissionUseCase(locationService).call();

  Future<void> checkPermission() async {
    final permission = await CheckPermissionUseCase(locationService).call();
    if (permission == LocationPermission.denied) return;
    _locationPermission.value = permission;
  }

  Future<bool> openLocationSettings() => locationService.openLocationSettings();

  Future<bool> openAppSettings() => locationService.openAppSettings();

  Future<Object?> pushToStart() => Modular.to.pushReplacementNamed('./start/');
}
