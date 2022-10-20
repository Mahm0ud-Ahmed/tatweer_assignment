import 'package:flutter/material.dart';
import 'package:oranos_assessment/src/core/config/routes/constant_route.dart';
import 'package:oranos_assessment/src/presentation/controller/helpers/navigation_helper.dart';
import 'package:oranos_assessment/src/presentation/widgets/button_widget.dart';

import '../../../../core/config/assets/assets.gen.dart';
import '../../../../core/config/l10n/generated/l10n.dart';
import '../../../../core/config/themes/theme_manager.dart';
import '../../../../core/utils/size_config.dart';
import '../../../widgets/image_widget.dart';

class StartBodyWidget extends StatelessWidget {
  const StartBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: SizeConfig.safeBlockVertical * 2.5,
      top: 0,
      left: 0,
      right: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              ImageWidget(
                image: Assets.images.appLogo,
              ),
              const SizedBox(height: 18),
              Text(
                S.of(context).start_page_body_title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          Flexible(child: SizedBox(height: SizeConfig.screenHeight /3,)),
          Column(
            children: [
              ButtonWidget(
                title: S.of(context).start_page_button_title, 
                width: SizeConfig.screenWidth - 48,
                onTab: ()=> NavigationHelper.push(context, kWelcomePage),
              ),
              const SizedBox(height: 18),
              RichText(
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 2,
                text: TextSpan(
                  text: S.of(context).start_page_dont_account_title,
                  style: Theme.of(context).textTheme.titleSmall,
                  children: <TextSpan>[
                    TextSpan(
                      text: S.of(context).start_page_sign_up_title, 
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: ThemeManager().appColor[5]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.language, ),
                  const SizedBox(width: 8),
                  Text(
                    S.of(context).start_page_language_title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}