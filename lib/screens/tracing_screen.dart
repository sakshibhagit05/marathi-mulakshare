import 'package:flutter/material.dart';

import '../widgets/drawing_board.dart';
import '../widgets/dashed_letter.dart';
import '../data/marathi_letter_mapping.dart';
import '../services/tts_service.dart';

class TracingScreen extends StatefulWidget {
  final String letter;

  const TracingScreen({
    super.key,
    required this.letter,
  });

  @override
  State<TracingScreen> createState() => _TracingScreenState();
}

class _TracingScreenState extends State<TracingScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        // Speak only the Marathi letter
        TtsService.speak(widget.letter);
      },
    );
  }

  String getSvgFile(String letter) {
    if (letterToSvg.containsKey(letter)) {
      return letterToSvg[letter]!;
    }

    if (barakhadiToSvg.containsKey(letter)) {
      return barakhadiToSvg[letter]!;
    }

    return "ka.svg";
  }

  @override
  Widget build(BuildContext context) {
    final String svgFile = getSvgFile(widget.letter);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.letter),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.volume_up),
            onPressed: () {
              TtsService.speak(widget.letter);
            },
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFF8F4E3),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Text(
              widget.letter,
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  (letterToSvg.containsKey(widget.letter) ||
                          barakhadiToSvg.containsKey(widget.letter))
                      ? DashedLetter(
                          svgFile: svgFile,
                        )
                      : Text(
                          widget.letter,
                          style: TextStyle(
                            fontSize: 220,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade300,
                          ),
                        ),

                  DrawingBoard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}