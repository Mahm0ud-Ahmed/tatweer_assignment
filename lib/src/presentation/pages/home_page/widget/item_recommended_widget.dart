import 'package:flutter/material.dart';
import 'package:oranos_assessment/src/data/models/user_model.dart';
import 'package:oranos_assessment/src/presentation/pages/home_page/widget/bottom_info_recommended_item_widget.dart';

import '../../../../core/config/themes/theme_manager.dart';
import '../../../widgets/image_widget.dart';

class ItemRecommendedWidget extends StatelessWidget {
  final UserModel user;
  const ItemRecommendedWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: SizedBox(
        width: 180,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: ThemeManager().appColor[4],
              width: 0.2
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 112,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: ImageWidget(
                    image: user.image, 
                    fit: BoxFit.cover,
                  )
                ),
              ),
              BottomInfoRecommendedItemWidget(
                user: user,
              ),
            ],
          ),
        ),
      ),
    );
  }
}