import 'dart:convert';
import 'package:care_mingle/core/consts/secure_keys.dart';
import 'package:care_mingle/core/exceptions/cache_exception.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalData {
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  Future<void> saveSecureString(String boxName, String string) async {
    try {
      String? storedSecureKey =
          await secureStorage.read(key: SECURE_STORAGE_KEY);
      if (storedSecureKey == null) {
        final secureKey = Hive.generateSecureKey();
        await secureStorage.write(
            key: SECURE_STORAGE_KEY, value: json.encode(secureKey));
      }
      List<int> encryptionKey =
          (json.decode(storedSecureKey!) as List<dynamic>).cast<int>();
      final encryptedBox = await Hive.openBox(boxName,
          encryptionCipher: HiveAesCipher(encryptionKey));
      await encryptedBox.put(string, string);

      await encryptedBox.close();
    } on Exception catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<String> getString(String boxName, String string) async {
    try {
      final secureKey = await secureStorage.read(key: SECURE_STORAGE_KEY);
      List<int> encryptionKey =
          (json.decode(secureKey!) as List<dynamic>).cast<int>();
      final encryptedBox = await Hive.openBox(boxName,
          encryptionCipher: HiveAesCipher(encryptionKey));
      String value = encryptedBox.get(string);
      await encryptedBox.close();
      return value;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<void> delete(String boxName, string) async {
    try {
      final secureKey = await secureStorage.read(key: SECURE_STORAGE_KEY);
      List<int> encryptionKey =
          (json.decode(secureKey!) as List<dynamic>).cast<int>();
      final encryptedBox = await Hive.openBox(boxName,
          encryptionCipher: HiveAesCipher(encryptionKey));
      encryptedBox.delete(string);
      await encryptedBox.close();
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<bool> checkExistance(String key) async {
    try {
      final secureKey = await secureStorage.read(key: SECURE_STORAGE_KEY);
      List<int> encryptionKey =
          (json.decode(secureKey!) as List<dynamic>).cast<int>();
      final encryptedBox = await Hive.openBox(key,
          encryptionCipher: HiveAesCipher(encryptionKey));
      final result = encryptedBox.get(key);
      if (result != null) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
