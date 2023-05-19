import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putData(
      {required String key1, required bool value2}) async {
    return await sharedPreferences!.setBool(key1, value2);
  }

  static bool? getData({required String key}) {
    return sharedPreferences!.getBool(key);
  }
}
