import 'package:shared_preferences/shared_preferences.dart';

import 'persistance_exception.dart';

class SPUtil {
  SPUtil._();
  static SharedPreferences? sharedPreferences;
  SharedPreferences get instance =>
      sharedPreferences ?? (throw Exception("Not Initialized"));

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static String read(String key) {
    try {
      print(sharedPreferences?.getString(key) ?? "");
      return sharedPreferences?.getString(key) ?? "";
    } catch (e) {
      throw PersistanceException('There is a problem in reading $key: $e');
    }
  }

  static int readInt(String key) {
    try {
      return sharedPreferences!.getInt(key) as int;
    } catch (e) {
      throw PersistanceException('There is a problem in reading $key: $e');
    }
  }

  static bool readBool(String key) {
    try {
      return sharedPreferences!.getBool(key) as bool;
    } catch (e) {
      throw PersistanceException('There is a problem in reading $key: $e');
    }
  }

  static writeString<T>(String key, T value) async {
    try {
      return sharedPreferences?.setString(key, value as String);
    } catch (e) {
      throw PersistanceException('There is a problem in writing $key: $e');
    }
  }

  static Future<bool> writebool<T>(String key, bool value) async {
    try {
      return sharedPreferences!.setBool(key, value);
    } catch (e) {
      throw PersistanceException('There is a problem in writing $key: $e');
    }
  }

  static Future<bool> writeInt<T>(String key, int value) async {
    try {
      return sharedPreferences!.setInt(key, value);
    } catch (e) {
      throw PersistanceException('There is a problem in writing $key: $e');
    }
  }

  static Future<bool> delete(String key) async {
    return sharedPreferences!.remove(key);
  }

  static Future<void> deleteAll() {
    return sharedPreferences!.clear();
  }

  static Future<void> logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getKeys().forEach((element) {
      preferences.remove(element);
    });
  }
}
