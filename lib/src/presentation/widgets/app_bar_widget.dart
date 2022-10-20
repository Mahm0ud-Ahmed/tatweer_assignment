import 'package:flutter/material.dart';
import 'package:oranos_assessment/src/core/config/assets/assets.gen.dart';
import 'package:oranos_assessment/src/data/local_data.dart';
import '../../core/config/themes/theme_manager.dart';
import 'image_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: ImageWidget(image: Assets.images.appLogo, fit: BoxFit.contain, width: 96,),
            centerTitle: true,
            leadingWidth: 32,
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: ImageWidget(image: myUser['image'], fit: BoxFit.cover)),
            ),
            actions: [
              Icon(
                Icons.search,
                color: ThemeManager().appColor[4],
              ),
            ],
          ),
        ),
        const Divider(
          height: 0,
          thickness: 0.8,
        ),
      ],
    );
  }
}
