

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tribot/feature/chatbot_feature.dart';
import 'package:tribot/feature/image_feature.dart';
import 'package:tribot/feature/translator_feature.dart';

enum HomeType{chatBot,imageGenerator,aiTranslator}

extension NameHomeType on HomeType{
  String get title => switch(this){
    HomeType.chatBot => 'ChatBot',
    HomeType.imageGenerator => 'Image Generator',
    HomeType.aiTranslator => 'Translator',
  };


    String get image => switch(this){
    HomeType.chatBot => 'loading.json',
    HomeType.imageGenerator => 'chep.json',
    HomeType.aiTranslator => 'prison.json',
  };

   VoidCallback get onTap => switch(this){
    HomeType.chatBot => () => Get.to(()=> const ChatBotFeature()),
    HomeType.imageGenerator => () => Get.to(()=>const ImageFeature()),
    HomeType.aiTranslator => () => Get.to(()=>const TranslatorFeature()),
  };
}