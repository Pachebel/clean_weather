import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  Future<void> clear();
  Future<void> delete(String key);
  Future<String?> read(String key);
  Future<bool> write(String key, dynamic value);
}

class LocalStorageService implements LocalStorage {
  LocalStorageService() {
    _init();
  }
  late final SharedPreferences _sp;

  Future<SharedPreferences> _init() async =>
      _sp = await SharedPreferences.getInstance();

  @override
  Future<void> clear() async => _sp.clear();

  @override
  Future<void> delete(String key) async => _sp.remove(key);

  @override
  Future<String?> read(String key) async => _sp.getString(key);

  @override
  Future<bool> write(String key, dynamic val) async {
    if (val is bool) return _sp.setBool(key, val);
    if (val is String) return _sp.setString(key, val);
    if (val is int) return _sp.setInt(key, val);
    if (val is double) return _sp.setDouble(key, val);
    if (val is List<String>) return _sp.setStringList(key, val);
    throw ArgumentError('Unsupported value type');
  }
}
