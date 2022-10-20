import 'package:flutter/material.dart';
import 'package:oranos_assessment/src/data/models/user_model.dart';

import '../../../../core/config/themes/theme_manager.dart';
import '../../../widgets/image_widget.dart';

class ItemOnlineWidget extends StatelessWidget {
  final UserModel onlineUser;
  const ItemOnlineWidget({super.key, required this.onlineUser});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: ImageWidget(image: onlineUser.image, width: 80, height: 80,)
              ),
              const Positioned(
                top: 4,
                right: 8,
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.green,
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 60,
            child: Text(
              getFirstName(onlineUser.name!), 
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ThemeManager().appColor[4], fontWeight: FontWeight.w400, letterSpacing: 0.7),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  String getFirstName(String name){
    return name.split(' ').first;
  }
}