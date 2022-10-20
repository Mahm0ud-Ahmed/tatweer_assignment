
import 'package:flutter/material.dart';

import '../../../../core/config/themes/theme_manager.dart';

class BottomNavBarWidget extends StatelessWidget {
  BottomNavBarWidget({
    super.key,
  });

  final _icon = [
    Icons.home_outlined,
    Icons.star_border_outlined,
    Icons.tv,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: ThemeManager().appColor[4],
              width: 0.2,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(4, (index) {
              return Flexible(child: IconButton(icon: Icon(_icon[index]), onPressed: (){},));
            }),
          ),
        ),
      ),
    );
  }
}
