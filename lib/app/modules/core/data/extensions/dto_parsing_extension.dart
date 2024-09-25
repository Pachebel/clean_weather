import 'package:clean_weather/app/modules/core/data/source/dtos/weather_dto.dart';

extension DtoParsingExtension on Map<String, dynamic> {
  List<WeatherDto>? parseWeatherList(String key) {
    final value = this[key];
    if (value == null) return null;
    return List<Map<String, dynamic>>.from(value as List)
        .map(WeatherDto.fromMap)
        .toList();
  }
}
