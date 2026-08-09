import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  static final FlutterTts _tts = FlutterTts();

  static Future<void> speak(String text) async {
    await _tts.stop();

    print(await _tts.getLanguages);

    var result = await _tts.setLanguage("mr-IN");
    print("Language Result: $result");

    await _tts.setSpeechRate(0.45);
    await _tts.setPitch(1.0);
    await _tts.awaitSpeakCompletion(true);

    await _tts.speak(text);
  }

  static Future<void> stop() async {
    await _tts.stop();
  }
}