// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'i_theme.dart';

class LightTheme implements ITheme{
  
  @override
  late List<Color> color;
  
  @override
  late Map<ThemeTextStyle, TextStyle> style;

  @override
  MaterialColor primarySwatch = Colors.blue;

  @override
  List<Color> get appColor {
    return color = const [
      /* index = 0 */    Color(0xff3699FF), //Blue
      /* index = 1 */    Color(0xffFFA800), //Warning
      /* index = 2 */    Color(0xffF64E60), //Danger
      /* index = 3 */    Color(0xff1BC5BD), //Success
      /* index = 4 */    Color(0xff77838F), //Container Color
      /* index = 5 */    Color(0xff16919B), //Main Grain
      /* index = 6 */    Color(0xffCFD9DE), //Border
      /* index = 7 */    Colors.black,        //Fonts Color
    ];
  }

  @override
  Map<ThemeTextStyle, TextStyle> get appStyle {
    return style = {};
  }
  

}
