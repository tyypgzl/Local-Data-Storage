import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static HiveHelper? _instance;

  static HiveHelper get instance => _instance ??= HiveHelper._init();

  HiveHelper._init() {
    _init();
  }

  Future<void> _init() async {
    await Hive.initFlutter('/hive');
  }

  Box<dynamic>? _initialBox;

  void changeInitialBox(Box newBox) {
    _initialBox = newBox;
  }

  Future<Box<T>> hiveOpenBox<T>(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<T>(boxName);
    } else {
      return Hive.box<T>(boxName);
    }
  }

  Future<void> hiveCloseBox() async {
    await _initialBox?.close();
  }

  Future<int?> hiveClearBox() async {
    return await _initialBox?.clear();
  }

  Future<void> setStringValue(String key, String value) async {
    await _initialBox?.put(key, value);
  }

  Future<String> getStringValue(String key) async {
    return await _initialBox?.get(key);
  }
}
