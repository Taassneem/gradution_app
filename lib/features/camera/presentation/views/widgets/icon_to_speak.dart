import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:gradution_app/core/func/is_arabic_func.dart';

import 'icon_method.dart';

class IconToSpeak extends StatefulWidget {
  const IconToSpeak({super.key});

  @override
  State<IconToSpeak> createState() => _IconToSpeakState();
}

class _IconToSpeakState extends State<IconToSpeak> {
  final FlutterTts flutterTts = FlutterTts();
  @override
  void initState() {
    super.initState();
    initTTS();
  }

  void initTTS() {
    flutterTts.getVoices.then((data) {
      try {
        List<Map> voices = List<Map>.from(data);
        // voices=voices.where((element)=> element[''])
        log(voices.toString());
      } catch (e) {
        log(e.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconMethod(
      icon: Icons.volume_off,
      rightIcon: isArabic() ? true : false,
      onTap: () {},
    );
  }
}
