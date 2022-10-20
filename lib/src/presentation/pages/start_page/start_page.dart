import 'package:flutter/material.dart';
import 'package:oranos_assessment/src/core/config/assets/assets.gen.dart';
import 'package:oranos_assessment/src/core/utils/size_config.dart';
import 'package:oranos_assessment/src/presentation/pages/start_page/widget/start_body_widget.dart';
import 'package:oranos_assessment/src/presentation/widgets/image_widget.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: true,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              ImageWidget(
                image: Assets.images.image,
                fit: BoxFit.fill,
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight,
              ),
              const StartBodyWidget(),
            ],
          ),
        ),
      )
    );
  }
}