import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lyra/helper/global.dart';
import 'package:lyra/model/message.dart';

class MessageCart extends StatelessWidget {
  final Message message;
  const MessageCart({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return message.msgType == MessageType.bot
        ? Row(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items at the top
          children: [
            SizedBox(width: 8),
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: Image.asset("assets/icons/assistant.png", width: 24),
            ),
            Flexible(
              // Wrap the Container in Flexible
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: mq.height * .01,
                  horizontal: mq.width * .03,
                ),
                margin: EdgeInsets.only(
                  bottom: mq.height * .02,
                  right: mq.width * 0.02,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15,
                  ).copyWith(bottomLeft: Radius.circular(0)),
                  border: Border.all(color: Colors.black),
                ),
                child:
                    message.msg.isEmpty
                        ? AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              "Please wait...",
                              textAlign: TextAlign.center,
                              speed: const Duration(milliseconds: 100),
                            ),
                          ],
                          repeatForever: true,
                        )
                        : Text(message.msg),
              ),
            ),
          ],
        )
        : Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                constraints: BoxConstraints(maxWidth: mq.width * 0.6),
                padding: EdgeInsets.symmetric(
                  vertical: mq.height * .01,
                  horizontal: mq.width * .03,
                ),
                margin: EdgeInsets.only(
                  bottom: mq.height * .02,
                  right: mq.width * 0.02,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15,
                  ).copyWith(bottomRight: Radius.circular(0)),
                  border: Border.all(color: Colors.black),
                ),
                child: Text(message.msg, textAlign: TextAlign.center),
              ),
            ),
            SizedBox(width: 8),
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: Image.asset("assets/icons/boy.png", width: 24),
            ),
          ],
        );
  }
}
