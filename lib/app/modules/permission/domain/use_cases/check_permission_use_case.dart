import 'package:clean_weather/app/modules/core/data/services/geo_location_service.dart';
import 'package:geolocator/geolocator.dart';

class CheckPermissionUseCase {
  final GeoLocationService locationService;

  CheckPermissionUseCase(this.locationService);

  Future<LocationPermission> call() async => locationService.checkPermission();
}
