
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UIProvider extends ChangeNotifier{
  Color primaryColor = Colors.blue; // Màu chính mặc định
  String fontFamily = 'Roboto'; // Font chữ mặc định
  bool _isDark = false;
  bool get isDark => _isDark;

  late SharedPreferences storage;

final darkTheme = ThemeData(
  primaryColor: Colors.black12,
  brightness: Brightness.dark,
  primaryColorDark: Colors.black12
);
final lightTheme = ThemeData(
  primaryColor: Colors.white,
  brightness: Brightness.light,
  primaryColorDark: Colors.white
);
  changeTheme(){
    _isDark = !isDark;
    storage.setBool("isDark", _isDark);
    notifyListeners();
  }
  void updatePrimaryColor(Color color) {
    primaryColor = color;
    notifyListeners();
  }

  void updateFontFamily(String font) {
    fontFamily = font;
    notifyListeners();
  }
  init() async{
    storage = await SharedPreferences.getInstance();
    _isDark = storage.getBool("isDark")??false;
    notifyListeners();
  }
}