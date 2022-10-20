import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oranos_assessment/src/core/config/injector.dart';
import 'package:oranos_assessment/src/core/utils/size_config.dart';
import 'package:oranos_assessment/src/data/models/chat_model.dart';
import 'package:oranos_assessment/src/presentation/pages/chat_page/widget/chat_bottom_bar_widget.dart';
import 'package:oranos_assessment/src/presentation/pages/chat_page/widget/receiver_chat_widget.dart';
import 'package:oranos_assessment/src/presentation/pages/chat_page/widget/sender_chat_widget.dart';

import '../../controller/data_bloc/api_data_bloc.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final ApiDataBloc _chatBloc;
  late final ValueNotifier<int> valueNotifier;
  late final ValueNotifier<ChatModel?> chatNotifier;

  @override
  void initState() {
    super.initState();
    _chatBloc = injector()..add(ApiDataChat(0));
    valueNotifier = ValueNotifier(0);
    chatNotifier = ValueNotifier(null);
  }

  @override
  void dispose() {
    valueNotifier.dispose();
    chatNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: BlocBuilder<ApiDataBloc, ApiDataState>(
                bloc: _chatBloc,
                builder: (context, state) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.data == null ? 0 : (state.data as List<ChatModel>).length,
                    itemBuilder: (context, index) {
                      chatNotifier.value = (state.data as List<ChatModel>)[index];
                      valueNotifier.value = (state.data as List<ChatModel>).length;
                      return Column(
                        children: [
                          chatNotifier.value?.senderId == 10 ?
                          SenderChatWidget(chat: chatNotifier.value!,) : ReceiverChatWidget(chat: chatNotifier.value!),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            ChatBottomBarWidget(
              chatNotifier: chatNotifier, 
              length: valueNotifier, 
              chatBloc: _chatBloc, 
            )
          ],
        ),
      ),
    );
  }
}