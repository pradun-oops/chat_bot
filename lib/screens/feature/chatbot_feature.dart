import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lyra/controller/chat_controller.dart';
import 'package:lyra/helper/global.dart';
import 'package:lyra/widgets/message_cart.dart';

class ChatBotFeature extends StatefulWidget {
  const ChatBotFeature({super.key});

  @override
  State<ChatBotFeature> createState() => _ChatBotFeatureState();
}

class _ChatBotFeatureState extends State<ChatBotFeature> {
  final _controller = ChatController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Chat with Lyra', style: TextStyle()),
        backgroundColor: Colors.white,
      ),
      body: Obx(
        () => ListView(
          controller: _controller.scrollController,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            top: mq.height * 0.02,
            bottom: mq.height * .1,
          ),
          children:
              _controller.list.map((e) => MessageCart(message: e)).toList(),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller.textController,
                onTapOutside: (e) => FocusScope.of(context).unfocus(),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,

                  hintText: "Ask me anything you want.",
                  isDense: true,
                  hintStyle: TextStyle(
                    fontSize: 14,

                    fontWeight: FontWeight.w500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
              ),
            ),
            SizedBox(width: 9),
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.blue,
              child: IconButton(
                onPressed: _controller.askQuestion,
                icon: Icon(Icons.send, color: Colors.white, weight: 17),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
