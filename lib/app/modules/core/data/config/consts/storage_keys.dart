class StorageKeys {
  static String weekForecastKey(DateTime day) =>
      'week_forecast_${day.year}_${day.month}_${day.day}';
}
