import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tribot/api/api_data.dart';
import 'package:tribot/model/messege.dart';

class ChatBotController extends GetxController{
  final textcontroller = TextEditingController();

  final list = <Messege>[Messege(msg: "Hi, How Can I Help You?", messegeType: MessegeType.bot)].obs;


  Future<void>askQuestion() async{
    if(textcontroller.text.isNotEmpty){
      list.add(Messege(msg: textcontroller.text, messegeType: MessegeType.user));
      list.add(Messege(msg: "Please wait sometime...", messegeType: MessegeType.bot));


      final res =await APIs.getAnswer(textcontroller.text);
      list.removeLast();
      list.add(Messege(msg: res, messegeType: MessegeType.bot));

      textcontroller.text = "";
    }
  }
}