// Flutter imports:
import 'package:flutter/material.dart';

class LanguageManager extends ChangeNotifier {
  Locale? locale;

  load() {
    String languageApp = 'en';
    locale = Locale(languageApp);
    notifyListeners();
  }

  bool get isRTL => locale?.languageCode == 'ar';

  static LanguageManager? _instance;

  LanguageManager._init();

  factory LanguageManager() => _instance ??= LanguageManager._init();
}
