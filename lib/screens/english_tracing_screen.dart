import 'package:flutter/material.dart';

import '../data/english_letter_mapping.dart';
import '../widgets/dashed_letter.dart';
import '../widgets/drawing_board.dart';

class EnglishTracingScreen extends StatelessWidget {
  final String letter;

  // Complete A-Z or 1-10 list
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
    // Directly return to the page from where
    // tracing screen was opened.
    Navigator.pop(context);
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

        // -----------------------------------------------
        // BACK
        // -----------------------------------------------

        leading: IconButton(
          onPressed: () {
            goBack(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 34,
            color: Colors.black87,
          ),
        ),

        // -----------------------------------------------
        // TITLE
        // -----------------------------------------------

        title: Text(
          letter,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        centerTitle: true,

        // -----------------------------------------------
        // NEXT
        // -----------------------------------------------

        actions: [
          if (hasNextLetter)
            TextButton(
              onPressed: () {
                goToNext(context);
              },
              child: const Text(
                "Next →",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),

          const SizedBox(width: 4),
        ],
      ),

      // =================================================
      // BODY
      // =================================================

      body: SafeArea(
        child: Column(
          children: [
            // ===========================================
            // SMALL CURRENT LETTER
            // ===========================================

            const SizedBox(height: 4),

            Text(
              letter,
              style: const TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 4),

            // ===========================================
            // LARGE TRACING AREA
            // ===========================================

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // -----------------------------------
                    // ENGLISH ALPHABET SVG
                    // -----------------------------------

                    if (hasSvg)
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: DashedLetter(
                            svgFile: "english/$svg",
                          ),
                        ),
                      )

                    // -----------------------------------
                    // ENGLISH NUMBER
                    // -----------------------------------

                    else
                      Positioned.fill(
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              letter,
                              style: TextStyle(
                                fontSize: 500,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                      ),

                    // -----------------------------------
                    // DRAWING BOARD
                    // -----------------------------------

                    Positioned.fill(
                      child: DrawingBoard(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}