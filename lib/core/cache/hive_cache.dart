import 'package:hive_flutter/adapters.dart';

class CountCacheManager {
  final String key = 'countValueKey';
  Box? _box;

  Future<void> init() async {
    if (!(_box?.isNotEmpty ?? false)) {
      _box = await Hive.openBox(key);
    }
  }

  int getValue(String key) {
    return _box?.get(key) ?? 0;
  }

  Future<void> addValue(int value) async {
    await _box?.put('count', value);
  }
}
