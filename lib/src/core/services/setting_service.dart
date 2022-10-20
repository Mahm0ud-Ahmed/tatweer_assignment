import 'package:flutter/material.dart';
import '../config/themes/language_manager.dart';
import '../config/themes/theme_manager.dart';
import 'service_interface.dart';

class SettingService implements ServiceInterface {
  @override
  String get name => "Setting";

  @override
  Future<void> initialize() async {
    ThemeManager().load();
    LanguageManager().load();
  }

  static ThemeMode get stateMod => ThemeManager().mode;
  static Locale get getLocale => LanguageManager().locale!;
}
