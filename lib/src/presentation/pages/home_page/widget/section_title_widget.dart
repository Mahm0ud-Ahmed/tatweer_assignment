import 'package:flutter/material.dart';

import '../../../../core/config/themes/theme_manager.dart';

class SectionTitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback onMore;
  const SectionTitleWidget({super.key, required this.title, required this.onMore});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: ThemeManager().appColor[7]),
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 1,
          ),
        ),
        IconButton(
          icon: Icon(Icons.more_horiz, color: ThemeManager().appColor[4]),
          onPressed: onMore,
        ),
      ],
    );
  }
}