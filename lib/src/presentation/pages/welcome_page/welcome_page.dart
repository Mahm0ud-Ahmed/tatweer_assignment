import 'package:flutter/material.dart';
import 'package:oranos_assessment/src/core/config/assets/assets.gen.dart';
import 'package:oranos_assessment/src/core/config/routes/constant_route.dart';
import 'package:oranos_assessment/src/core/utils/size_config.dart';
import 'package:oranos_assessment/src/presentation/controller/helpers/navigation_helper.dart';
import 'package:oranos_assessment/src/presentation/widgets/button_widget.dart';
import 'package:oranos_assessment/src/presentation/widgets/image_widget.dart';

import '../../../core/config/l10n/generated/l10n.dart';
import '../../widgets/choose_language_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.safeBlockVertical * 10,
              ),
              Center(
                child: SizedBox(
                  width: SizeConfig.screenWidth / 1.3,
                  child: Center(
                    child: Stack(
                      children: [
                        Positioned(
                          width: 200,
                          top: 0,
                          left: 0,
                          child: RichText(
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.justify,
                            softWrap: true,
                            text: TextSpan(
                              text: 'Hi, My name is ',
                              style: Theme.of(context).textTheme.titleMedium,
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Oranobot\n', 
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const TextSpan(
                                  text: 'I will always be there to help and assist you.\n\nSay Start To go to Next.', 
                                ),
                              ],
                            ),
                          ),
                        ),
                        ImageWidget(
                          image: Assets.images.arrow,
                          width: 240,
                          height: 200,
                          fit: BoxFit.fill,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ImageWidget(
                image: Assets.images.robot,
                height: 220,
              ),
              const SizedBox(height: 24),
              ButtonWidget(title: S.of(context).welcome_page_button_title, onTab: ()=> NavigationHelper.pushAndReplace(context, kChatPage)),
              const SizedBox(height: 54),
              const ChooseLanguageWidget(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      )
    );
  }
}