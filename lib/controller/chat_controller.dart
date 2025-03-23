import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lyra/apis/apis.dart';

import 'package:lyra/model/message.dart';

class ChatController extends GetxController {
  final textController = TextEditingController();

  final scrollController = ScrollController();

  final list =
      <Message>[
        Message(msgType: MessageType.bot, msg: "Hello, How can I assist you?"),
      ].obs;

  Future<void> askQuestion() async {
    if (textController.text.trim().isNotEmpty) {
      list.add(Message(msg: textController.text, msgType: MessageType.user));
      list.add(Message(msgType: MessageType.bot, msg: ""));
      _scrollDown();
      final respone = await Apis.getAnswer(textController.text);
      list.removeLast();
      list.add(Message(msgType: MessageType.bot, msg: respone));
      _scrollDown();
      textController.text = "";
    }
  }

  void _scrollDown() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: Duration(microseconds: 500),
      curve: Curves.ease,
    );
  }
}
