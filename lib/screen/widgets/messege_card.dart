import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tribot/model/messege.dart';

class MessageCard extends StatelessWidget {
  final Messege message;

  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    const r = Radius.circular(15);
    final mq = MediaQuery.of(context).size;
    return message.messegeType == MessegeType.bot

        //bot
        ? Row(children: [
            const SizedBox(width: 6),

            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: Image.asset('images/logo.png', scale:2),
            ),

            //
            Container(
              constraints: BoxConstraints(maxWidth: mq.width * .6),
              margin: EdgeInsets.only(
                  bottom: mq.height * .02, left: mq.width * .02),
              padding: EdgeInsets.symmetric(
                  vertical: mq.height * .01, horizontal: mq.width * .02),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.only(
                      topLeft: r, topRight: r, bottomRight: r)),
              child: message.msg.isEmpty
                  ? AnimatedTextKit(animatedTexts: [
                      TypewriterAnimatedText(
                        ' Please wait... ',
                        speed: const Duration(milliseconds: 100),
                      ),
                    ], repeatForever: true)
                  : Text(
                      message.msg,
                      textAlign: TextAlign.center,
                    ),
            )
          ])

        //user
        : Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            //
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                  constraints: BoxConstraints(maxWidth: mq.width * .6),
                  margin: EdgeInsets.only(
                      bottom: mq.height * .02, right: mq.width * .02),
                  padding: EdgeInsets.symmetric(
                      vertical: mq.height * .01, horizontal: mq.width * .02),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.only(
                          topLeft: r, topRight: r, bottomLeft: r)),
                  child: Text(
                    message.msg,
                    textAlign: TextAlign.center,
                  )),
            ),

            const CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.blue,),
            ),

            const SizedBox(width: 6),
          ]);
  }
}
