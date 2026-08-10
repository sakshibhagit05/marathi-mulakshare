import 'package:flutter/material.dart';

import '../data/english_letter_mapping.dart';
import '../widgets/dashed_letter.dart';
import '../widgets/drawing_board.dart';

class EnglishTracingScreen extends StatelessWidget {
  final String letter;

  // Complete alphabet OR number list
  final List<String> groupLetters;

  const EnglishTracingScreen({
    super.key,
    required this.letter,
    this.groupLetters = const [],
  });

  // =====================================================
  // CURRENT INDEX
  // =====================================================

  int get currentIndex {
    if (groupLetters.isEmpty) {
      return -1;
    }

    return groupLetters.indexOf(letter);
  }

  // =====================================================
  // HAS NEXT
  // =====================================================

  bool get hasNextLetter {
    if (groupLetters.isEmpty) {
      return false;
    }

    return currentIndex >= 0 &&
        currentIndex < groupLetters.length - 1;
  }

  // =====================================================
  // NEXT
  // =====================================================

  void goToNext(BuildContext context) {
    if (!hasNextLetter) {
      return;
    }

    final String nextLetter =
        groupLetters[currentIndex + 1];

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => EnglishTracingScreen(
          letter: nextLetter,
          groupLetters: groupLetters,
        ),
      ),
    );
  }

  // =====================================================
  // BACK
  // =====================================================

  void goBack(BuildContext context) {
    // Directly return to Alphabet / Numbers screen
    Navigator.of(context).pop();
  }

  // =====================================================
  // BUILD
  // =====================================================

  @override
  Widget build(BuildContext context) {
    final bool hasSvg =
        englishLetterToSvg.containsKey(letter);

    final String svg =
        englishLetterToSvg[letter] ?? "";

    return Scaffold(
      backgroundColor: const Color(0xFFF8F4E3),

      // =================================================
      // APP BAR
      // =================================================

      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF7FF),
        elevation: 0,

        automaticallyImplyLeading: false,

        // BACK
        leading: IconButton(
          onPressed: () {
            goBack(context);
          },

          icon: const Icon(
            Icons.arrow_back,
            size: 32,
            color: Colors.black87,
          ),
        ),

        // TITLE
        title: Text(
          letter,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        centerTitle: true,

        // NEXT
        actions: [
          if (hasNextLetter)
            Padding(
              padding: const EdgeInsets.only(right: 4),

              child: TextButton(
                onPressed: () {
                  goToNext(context);
                },

                child: const Text(
                  "Next →",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ),
        ],
      ),

      // =================================================
      // BODY
      // =================================================

      body: SafeArea(
        child: Column(
          children: [
            // ===========================================
            // SMALL TITLE LETTER
            // ===========================================

            const SizedBox(height: 5),

            Text(
              letter,
              style: const TextStyle(
                fontSize: 85,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            // ===========================================
            // TRACING AREA
            // ===========================================

            Expanded(
              child: Stack(
                alignment: Alignment.center,

                children: [
                  // ---------------------------------------
                  // LARGE SVG LETTER
                  // ---------------------------------------

                  if (hasSvg)
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final double size =
                            constraints.maxWidth < 600
                                ? constraints.maxWidth * 0.90
                                : 520;

                        return SizedBox(
                          width: size,
                          height: size,

                          child: DashedLetter(
                            svgFile: "english/$svg",
                          ),
                        );
                      },
                    )

                  // ---------------------------------------
                  // LARGE NUMBER
                  // ---------------------------------------

                  else
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final double fontSize =
                            constraints.maxWidth < 600
                                ? constraints.maxWidth * 0.75
                                : 360;

                        return Center(
                          child: Text(
                            letter,
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        );
                      },
                    ),

                  // ---------------------------------------
                  // DRAWING BOARD
                  // ---------------------------------------

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