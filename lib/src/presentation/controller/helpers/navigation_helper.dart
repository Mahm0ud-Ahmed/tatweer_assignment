import 'package:flutter/material.dart';

class NavigationHelper {

  static pushAndReplace(BuildContext context, String route, {bool rootNavigator = false}) {
    Navigator.of(context, rootNavigator: rootNavigator).pushReplacementNamed(route);
  }

  static push(BuildContext context, String route) {
    Navigator.of(context).pushNamed(route);
  }

  static pushAndRemoveAll(BuildContext context, String route) {
    Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
  }

  static popPage(BuildContext context) {
    Navigator.of(context).pop();
  }

}
