import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tribot/controller/chatbot_controller.dart';
import 'package:tribot/screen/widgets/messege_card.dart';

class ChatBotFeature extends StatefulWidget {
  const ChatBotFeature({super.key});

  @override
  State<ChatBotFeature> createState() => _ChatBotFeatureState();
}

class _ChatBotFeatureState extends State<ChatBotFeature> {
  final controller = ChatBotController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ChatBot",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 130, 156, 154),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
              controller: controller.textcontroller,
              textAlign: TextAlign.center,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                  hintText: "Write your promt....",
                  hintStyle: TextStyle(fontSize: 14),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            )),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: IconButton(
                    onPressed: controller.askQuestion,
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    )),
              ),
            )
          ],
        ),
      ),



      body: Obx(() => Padding(
        padding: const EdgeInsets.only(top:15.0),
        child: ListView( 
          physics:const BouncingScrollPhysics(),
          children: controller.list.map((element) => 
          MessageCard(message: element)).toList(),
        ),
      ),
    ));
  }
}
