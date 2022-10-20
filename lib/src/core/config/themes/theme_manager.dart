import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'i_theme.dart';
import 'light_theme.dart';

class ThemeManager extends ChangeNotifier {
  late ITheme _theme;
  late ThemeData _themeData;
  late ThemeMode _mode;
  bool _isDark = false;
  late List<Color> appColor;
  late Map<ThemeTextStyle, TextStyle> appStyle;

  load() {
    _isDark = false;

    initialCurrentThemeApp();
    appColor = _theme.appColor;
    appStyle = _theme.appStyle;
    setThemeData();
    setSystemStatusDefaultColor();

    notifyListeners();
  }

  initialCurrentThemeApp() {
    if (_isDark) {
      _mode = ThemeMode.dark;
    } else {
      _theme = LightTheme();
      _mode = ThemeMode.light;
    }
  }

  changeThemeMode(ITheme theme) {
    _theme = theme;
    initialCurrentThemeByTheme();
    appColor = _theme.appColor;
    appStyle = _theme.appStyle;
    setThemeData();
    setSystemStatusDefaultColor();
    notifyListeners();
  }

  initialCurrentThemeByTheme() {
    switch (_theme.runtimeType) {
      case LightTheme:
        _theme = LightTheme();
        _mode = ThemeMode.light;
        break;
      default:
        _theme = LightTheme();
        _mode = ThemeMode.light;
    }
  }

  ThemeMode get mode => _mode;

  bool get isLight => mode == ThemeMode.light ? true : false;

  void setThemeData() {
    _themeData = ThemeData(
      brightness: isLight ? Brightness.light : Brightness.dark,
      fontFamily: 'Poppins',
      textTheme: initTextStyle(),
    );
  }

  TextTheme initTextStyle() {
    return TextTheme(
      titleLarge: TextStyle(color:  appColor[4], fontSize: 18, fontWeight: FontWeight.w900, overflow: TextOverflow.ellipsis),
      titleMedium: TextStyle(color: appColor[7], fontSize: 16, overflow: TextOverflow.ellipsis),
      titleSmall: TextStyle(color:  appColor[7], fontSize: 12, overflow: TextOverflow.ellipsis, height: 1.8),
      bodyLarge: TextStyle(color:   appColor[7], fontSize: 12, overflow: TextOverflow.ellipsis, height: 1.5),
      bodyMedium: TextStyle(color:  appColor[7], fontSize: 10, overflow: TextOverflow.ellipsis),
      bodySmall: TextStyle(color:   appColor[7], fontSize: 8,  overflow: TextOverflow.ellipsis),
      labelSmall: TextStyle(color:  appColor[7], fontSize: 12,  overflow: TextOverflow.visible),
      
    );
  }

  void setSystemStatusDefaultColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: _theme.appColor[4],
      statusBarIconBrightness: isLight ? Brightness.dark : Brightness.light,
      statusBarBrightness: isLight ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
  }

  ThemeData get myTheme => _themeData;

  static ThemeManager? _instance;

  ThemeManager._init();

  factory ThemeManager() => _instance ??= ThemeManager._init();
}
