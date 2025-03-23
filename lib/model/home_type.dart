import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/route_manager.dart';
import 'package:lyra/screens/feature/chatbot_feature.dart';
import 'package:lyra/screens/feature/image_feature.dart';
import 'package:lyra/screens/feature/translator_feature.dart';

enum HomeType { aiChatBot, aiImage, aiTranslator }

extension MyHomeType on HomeType {
  String get title => switch (this) {
    HomeType.aiChatBot => "AI ChatBot",

    HomeType.aiImage => "AI Image Generator",

    HomeType.aiTranslator => "AI Language Translator",
  };

  String get lottie => switch (this) {
    HomeType.aiChatBot => "assets/animation/Animation - 1742699505293.json",

    HomeType.aiImage => "assets/animation/Animation - 1742699439643.json",

    HomeType.aiTranslator => "assets/animation/Animation - 1742699377039.json",
  };

  bool get leftAlign => switch (this) {
    HomeType.aiChatBot => true,

    HomeType.aiImage => false,

    HomeType.aiTranslator => true,
  };

  EdgeInsets get padding => switch (this) {
    HomeType.aiChatBot => EdgeInsets.zero,

    HomeType.aiImage => EdgeInsets.all(20),

    HomeType.aiTranslator => EdgeInsets.zero,
  };

  VoidCallback get onTap => switch (this) {
    HomeType.aiChatBot => () => Get.to(() => ChatBotFeature()),

    HomeType.aiImage => () => Get.to(() => ImageFeature()),

    HomeType.aiTranslator => () => Get.to(() => TranslatorFeature()),
  };
}
