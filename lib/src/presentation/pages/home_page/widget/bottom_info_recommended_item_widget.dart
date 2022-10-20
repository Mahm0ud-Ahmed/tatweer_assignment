import 'package:flutter/material.dart';

import '../../../../core/config/themes/theme_manager.dart';
import '../../../../data/models/user_model.dart';

class BottomInfoRecommendedItemWidget extends StatefulWidget {
  final UserModel user;

  const BottomInfoRecommendedItemWidget({super.key, required this.user});

  @override
  State<BottomInfoRecommendedItemWidget> createState() => _BottomInfoRecommendedItemWidgetState();
}

class _BottomInfoRecommendedItemWidgetState extends State<BottomInfoRecommendedItemWidget> {
  late final ValueNotifier<bool> _notifierFavorite;

  @override
  void initState() {
    super.initState();
    _notifierFavorite = ValueNotifier(widget.user.isFavorite!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.star, color: ThemeManager().appColor[1]),
                  Text(' (${widget.user.rate})', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ThemeManager().appColor[4])),
                ],
              ),
              ValueListenableBuilder<bool>(
                valueListenable: _notifierFavorite,
                builder: (context, isFavorite, child) {
                  return IconButton(
                    icon: Icon(Icons.favorite, color: isFavorite ? ThemeManager().appColor[2] : ThemeManager().appColor[6]),
                    onPressed: ()=> _notifierFavorite.value = !isFavorite,
                  );
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(widget.user.name!, style: Theme.of(context).textTheme.bodyLarge,),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, left: 8, right: 8),
          child: Text(widget.user.title!, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ThemeManager().appColor[4]),),
        ),
      ],
    );
  }
}