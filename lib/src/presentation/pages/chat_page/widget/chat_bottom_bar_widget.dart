import 'package:flutter/material.dart';
import 'package:oranos_assessment/src/core/config/routes/constant_route.dart';
import 'package:oranos_assessment/src/data/models/chat_model.dart';
import 'package:oranos_assessment/src/presentation/controller/data_bloc/api_data_bloc.dart';
import 'package:oranos_assessment/src/presentation/controller/helpers/navigation_helper.dart';

import '../../../../core/config/themes/theme_manager.dart';
import '../../../../core/utils/size_config.dart';
import '../../../widgets/generic_text_field.dart';

class ChatBottomBarWidget extends StatefulWidget {
  final ValueNotifier<int> length;
  final ValueNotifier<ChatModel?> chatNotifier;
  final ApiDataBloc chatBloc;

  const ChatBottomBarWidget({super.key,required this.length, required this.chatBloc, required this.chatNotifier});

  @override
  State<ChatBottomBarWidget> createState() => _ChatBottomBarWidgetState();
}

class _ChatBottomBarWidgetState extends State<ChatBottomBarWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: 56,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: 48,
                width: SizeConfig.screenWidth,
                child: GenericTextField(
                  controller: _controller,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if(widget.chatNotifier.value?.leaveChat != null && widget.chatNotifier.value?.leaveChat == true){
                  NavigationHelper.push(context, kHomePage);
                }else{
                  if(_controller.text.trim().isNotEmpty){
                    ChatModel chat = ChatModel(
                      senderId: 10,
                      receiveId: 124,
                      message: _controller.text,
                    );
                    _controller.clear();
                    widget.chatBloc.add(ApiDataChat(widget.length.value, chat: chat));
                  }
                }
              }, 
              icon: Icon(Icons.send, color: ThemeManager().appColor[5],)),
          ],
        ),
      ),
    );
  }
}