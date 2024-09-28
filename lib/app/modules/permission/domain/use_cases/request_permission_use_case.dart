import 'package:clean_weather/app/modules/core/data/services/geo_location_service.dart';
import 'package:geolocator/geolocator.dart';

class RequestPermissionUseCase {
  final GeoLocationService locationService;

  RequestPermissionUseCase(this.locationService);

  Future<LocationPermission> call() async =>
      locationService.requestPermission();
}
