import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  static final FlutterTts _tts = FlutterTts();

  // Marathi voice
  static Future<void> speak(String text) async {
    await _tts.stop();

    await _tts.setLanguage("mr-IN");
    await _tts.setSpeechRate(0.45);
    await _tts.setPitch(1.0);
    await _tts.awaitSpeakCompletion(true);

    await _tts.speak(text);
  }

  // English voice
  static Future<void> speakEnglish(String text) async {
    await _tts.stop();

    await _tts.setLanguage("en-US");
    await _tts.setSpeechRate(0.45);
    await _tts.setPitch(1.0);
    await _tts.awaitSpeakCompletion(true);

    await _tts.speak(text);
  }

  // Stop voice
  static Future<void> stop() async {
    await _tts.stop();
  }
}