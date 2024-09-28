import 'package:clean_weather/app/modules/core/data/services/geo_location_service.dart';
import 'package:geolocator/geolocator.dart';

class GetCurrentPositionUseCase {
  final GeoLocationService locationService;

  GetCurrentPositionUseCase(this.locationService);

  Future<Position> call() async => locationService.getCurrentPosition();
}
