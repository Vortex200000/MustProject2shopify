import 'package:shared_preferences/shared_preferences.dart';

class SharedPreff {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

// SharedPreff(this.sharedPreferences);

  static Future<bool> SaveToken({required String Data, required String Key}) {
    return sharedPreferences.setString(Key, Data);
  }

  static String? GetToken({required String Key}) {
    return sharedPreferences.getString(Key);
  }


}