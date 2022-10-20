// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Oranos`
  String get app_name {
    return Intl.message(
      'Oranos',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Expert From Every Planet`
  String get start_page_body_title {
    return Intl.message(
      'Expert From Every Planet',
      name: 'start_page_body_title',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get start_page_button_title {
    return Intl.message(
      'Get Started',
      name: 'start_page_button_title',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account? `
  String get start_page_dont_account_title {
    return Intl.message(
      'Don’t have an account? ',
      name: 'start_page_dont_account_title',
      desc: '',
      args: [],
    );
  }

  /// `SignUp`
  String get start_page_sign_up_title {
    return Intl.message(
      'SignUp',
      name: 'start_page_sign_up_title',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get start_page_language_title {
    return Intl.message(
      'English',
      name: 'start_page_language_title',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get welcome_page_button_title {
    return Intl.message(
      'Next',
      name: 'welcome_page_button_title',
      desc: '',
      args: [],
    );
  }

  /// `Recommended Expert`
  String get home_page_recommended_title {
    return Intl.message(
      'Recommended Expert',
      name: 'home_page_recommended_title',
      desc: '',
      args: [],
    );
  }

  /// `Online Expert`
  String get home_page_online_title {
    return Intl.message(
      'Online Expert',
      name: 'home_page_online_title',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
