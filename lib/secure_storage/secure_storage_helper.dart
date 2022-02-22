import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  static SecureStorageHelper? _instance;

  static SecureStorageHelper get instance => _instance ??= SecureStorageHelper._init();

  late final FlutterSecureStorage _secureStorage;

  SecureStorageHelper._init() {
    _secureStorage = const FlutterSecureStorage();
  }

  Future<void> writeData(String key, String? value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> readData(String key) async {
    return await _secureStorage.read(key: key);
  }
}
