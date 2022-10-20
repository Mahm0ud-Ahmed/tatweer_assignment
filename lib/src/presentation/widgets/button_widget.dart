
import 'package:flutter/material.dart';

import '../../core/config/themes/theme_manager.dart';
import '../../core/utils/size_config.dart';

class ButtonWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final String title;
  final Color? backgroundColor;
  final VoidCallback onTab;
  final ValueNotifier<bool>? notifier;

  const ButtonWidget({
    super.key,
    this.width,
    this.height,
    this.radius,
    required this.title,
    required this.onTab,
    this.backgroundColor,
    this.notifier,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? SizeConfig.blockSizeHorizontal * 50,
      height: height ?? 54,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 8),
        child: ValueListenableBuilder<bool>(
          valueListenable: notifier ?? ValueNotifier(false),
          builder: (context, value, child) {
            if (value) {
              return const Center(child: CircularProgressIndicator());
            }
            return ElevatedButton(
              onPressed: onTab,
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor ?? ThemeManager().appColor[5],
              ),
              child: Text(title),
            );
          },
        ),
      ),
    );
  }
}
