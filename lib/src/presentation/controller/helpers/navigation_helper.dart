import 'package:flutter/material.dart';

class NavigationHelper {
  static push(BuildContext context, String route) {
    Navigator.of(context).pushNamed(route);
  }

  static popPage(BuildContext context) {
    Navigator.of(context).pop();
  }

}
