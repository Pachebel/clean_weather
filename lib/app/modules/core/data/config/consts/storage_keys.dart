class StorageKeys {
  static String weekForecastKey(DateTime day) =>
      'week_forecast_${day.toIso8601String()}';
}
