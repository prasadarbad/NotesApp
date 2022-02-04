import 'package:shared_preferences/shared_preferences.dart';

class CheckBox1 {
  // ignore: unused_field
  static SharedPreferences? _preferences;

  static const _isChecked = 'isChecked';
  static const _index1 = 'index1';
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setIndex(String index1) async =>
      await _preferences!.setString(_index1, index1);

  static String? getIndex() => _preferences!.getString(_index1);

  static Future setCheckBox(bool isChecked) async =>
      await _preferences!.setBool(_isChecked, isChecked);

  static bool? getCheckbox() => _preferences!.getBool(_isChecked);
}
