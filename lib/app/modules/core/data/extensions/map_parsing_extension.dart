extension MapParsingExtension on Map<String, dynamic> {
  int? parseInt(String key) {
    final value = this[key];
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }

  double? parseDouble(String key) {
    final value = this[key];
    if (value is double) return value;
    if (value is String) return double.tryParse(value);
    return null;
  }

  String? parseString(String key) {
    final value = this[key];
    if (value is String) return value;
    return value?.toString();
  }

  List<String>? parseStringList(String key) {
    final value = this[key];
    if (value == null) return null;
    return List<String>.from(value as List);
  }
}
