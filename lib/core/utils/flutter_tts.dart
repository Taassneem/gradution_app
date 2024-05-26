import 'package:flutter_tts/flutter_tts.dart';

class FlutterTtsMe {
  static FlutterTts flutterTts = FlutterTts();

  static Future<void> configureTts(
      {required double setSpeechRate, required double setVolume}) async {
    await flutterTts.setSpeechRate(setSpeechRate);
    await flutterTts.setVolume(setVolume);
  }

  void speakText(String text, String lang) async {
    await flutterTts.setLanguage(lang);

    await flutterTts.speak(text);
  }

  void stopSpeaking() async {
    await flutterTts.stop();
  }
}
