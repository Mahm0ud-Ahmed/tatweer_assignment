import 'package:flutter/material.dart';

import '../../../../core/config/assets/assets.gen.dart';
import '../../../../core/config/themes/theme_manager.dart';
import '../../../../data/models/chat_model.dart';
import '../../../widgets/image_widget.dart';

class ReceiverChatWidget extends StatefulWidget {
  final ChatModel chat;

  const ReceiverChatWidget({super.key, required this.chat});

  @override
  State<ReceiverChatWidget> createState() => _ReceiverChatWidgetState();
}

class _ReceiverChatWidgetState extends State<ReceiverChatWidget> {
  late final ValueNotifier<Map<String, bool>> checkBoxNotifier;
  late Map<String, bool> checkBox;

  @override
  void initState() {
    super.initState();
    if(widget.chat.data != null) {
      checkBox = {};
      widget.chat.data?.fold<Map<String, bool>>({}, (previousValue, element) {
        checkBox[element] = false;
        return previousValue;
      });
      checkBoxNotifier = ValueNotifier(checkBox);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: ThemeManager().appColor[6].withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: ImageWidget(image: Assets.icons.robotChatIcon, fit: BoxFit.contain,)),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: ThemeManager().appColor[6].withOpacity(0.4),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.chat.message!, 
                          style: Theme.of(context).textTheme.titleSmall,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                    if(widget.chat.data != null)
                    const SizedBox(height: 16),
                    if(widget.chat.data != null)
                    ...List.generate(checkBox.length, (index) {
                      return ValueListenableBuilder<Map<String, bool>>(
                        valueListenable: checkBoxNotifier,
                        builder: (context, checkValue, child) {
                          MapEntry<String, bool> currentItem = checkValue.entries.elementAt(index);
                          return CheckboxListTile(
                            value: checkValue.entries.elementAt(index).value, 
                            title: Text(checkValue.entries.elementAt(index).key),
                            checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            activeColor: ThemeManager().appColor[5],
                            contentPadding: EdgeInsets.zero,
                            onChanged: (value) {
                              if(value != null){
                                Map<String, bool> checkBox = Map.from(checkValue);
                                checkBox[currentItem.key] = value; 
                                checkBoxNotifier.value = checkBox;
                              }
                            },
                          
                          );
                        },
                      );
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}