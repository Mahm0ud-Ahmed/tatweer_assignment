import 'package:flutter/material.dart';

import '../../../../core/config/assets/assets.gen.dart';
import '../../../../core/config/themes/theme_manager.dart';
import '../../../widgets/image_widget.dart';

class HomeDraggableWidget extends StatelessWidget {
  const HomeDraggableWidget({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> _draggableItem = [
    {
      'title' : 'Information Technology',
      'subtitle' : '23 Experts',
      'icon' : Assets.icons.techBranchIcon,
    },
    {
      'title' : 'Supply Chain',
      'subtitle' : '12 Experts',
      'icon' : Assets.icons.settingIcon,
    },
    {
      'title' : 'Security',
      'subtitle' : '14 Experts',
      'icon' : Assets.icons.keyIcon,
    },
    {
      'title' : 'Human Resource',
      'subtitle' : '8 Experts',
      'icon' : Assets.icons.humanIcon,
    },
    {
      'title' : 'Immigration',
      'subtitle' : '18 Experts',
      'icon' : Assets.icons.paperIcon,
    },
    {
      'title' : 'Translation',
      'subtitle' : '3 Experts',
      'icon' : Assets.icons.translationIcon,
    },
  ];
    return Align(
      alignment: Alignment.bottomCenter,
      child: DraggableScrollableSheet(
          initialChildSize: MediaQuery.of(context).orientation == Orientation.portrait ? 0.02 : 0.1,
          minChildSize: MediaQuery.of(context).orientation == Orientation.portrait ? 0.02 : 0.1,
          maxChildSize: 0.7,
          snap: true,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16)
                )
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    const SizedBox(height: 4),
                    SizedBox(
                      width: 48,
                      height: 8,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: ThemeManager().appColor[4].withOpacity(0.4),
                          borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ThemeManager().appColor[4],
                                width: 0.4
                              ),
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: ListTile(
                              title: Text(_draggableItem[index]['title']),
                              subtitle: Text(
                                _draggableItem[index]['subtitle'],
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ThemeManager().appColor[4]),
                              ),
                              leading: ImageWidget(image: _draggableItem[index]['icon'], fit: BoxFit.contain, width: 32, height: 32,),
                              onTap: (){},
                            ),
                          ),
                        );
                      },
                      itemCount: _draggableItem.length,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
    );
  }
}