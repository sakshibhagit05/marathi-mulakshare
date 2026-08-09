import 'package:flutter/material.dart';

import '../data/english_letter_mapping.dart';
import '../widgets/dashed_letter.dart';
import '../widgets/drawing_board.dart';

class EnglishTracingScreen extends StatelessWidget {
  final String letter;

  const EnglishTracingScreen({
    super.key,
    required this.letter,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasSvg = englishLetterToSvg.containsKey(letter);
    final String svg = englishLetterToSvg[letter] ?? "";

    return Scaffold(
      appBar: AppBar(
        title: Text(letter),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFF8F4E3),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Text(
              letter,
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
                  // Alphabet -> Dashed SVG
                  if (hasSvg)
                    Center(
                      child: DashedLetter(
                        svgFile: "english/$svg",
                      ),
                    )

                  // Number -> Large Grey Number
                  else
                    Center(
                      child: Text(
                        letter,
                        style: TextStyle(
                          fontSize: 250,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),

                  // Drawing Board
                  Positioned.fill(
                    child: DrawingBoard(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}