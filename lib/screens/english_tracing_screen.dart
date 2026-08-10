import 'package:flutter/material.dart';

import '../data/english_letter_mapping.dart';
import '../widgets/dashed_letter.dart';
import '../widgets/drawing_board.dart';
import '../services/tts_service.dart';

class EnglishTracingScreen extends StatefulWidget {
  final String letter;

  // Complete list:
  // A-Z OR 1-10
  final List<String> groupLetters;

  const EnglishTracingScreen({
    super.key,
    required this.letter,
    this.groupLetters = const [],
  });

  @override
  State<EnglishTracingScreen> createState() =>
      _EnglishTracingScreenState();
}

class _EnglishTracingScreenState
    extends State<EnglishTracingScreen> {

  // =====================================================
  // CURRENT INDEX
  // =====================================================

  int get currentIndex {
    if (widget.groupLetters.isEmpty) {
      return -1;
    }

    return widget.groupLetters.indexOf(widget.letter);
  }

  // =====================================================
  // NEXT AVAILABLE?
  // =====================================================

  bool get hasNextLetter {
    if (widget.groupLetters.isEmpty) {
      return false;
    }

    return currentIndex >= 0 &&
        currentIndex <
            widget.groupLetters.length - 1;
  }

  // =====================================================
  // NEXT
  // =====================================================

  void goToNext() {
    if (!hasNextLetter) {
      return;
    }

    final String nextLetter =
        widget.groupLetters[currentIndex + 1];

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => EnglishTracingScreen(
          letter: nextLetter,

          // IMPORTANT:
          // Keep complete list
          groupLetters: widget.groupLetters,
        ),
      ),
    );
  }

  // =====================================================
  // BACK
  // =====================================================

  void goBack() {
    // Directly return to Alphabet / Numbers screen
    Navigator.of(context).pop();
  }

  // =====================================================
  // INITIAL SPEECH
  // =====================================================

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        if (mounted) {
          TtsService.speak(widget.letter);
        }
      },
    );
  }

  // =====================================================
  // BUILD
  // =====================================================

  @override
  Widget build(BuildContext context) {
    final bool hasSvg =
        englishLetterToSvg.containsKey(widget.letter);

    final String svg =
        englishLetterToSvg[widget.letter] ?? "";

    return Scaffold(
      backgroundColor: const Color(0xFFF8F4E3),

      // =================================================
      // APP BAR
      // =================================================

      appBar: AppBar(
        backgroundColor:
            const Color(0xFFFFF7FF),

        elevation: 0,

        automaticallyImplyLeading: false,

        // -------------------------------
        // BACK
        // -------------------------------

        leading: IconButton(
          onPressed: goBack,

          icon: const Icon(
            Icons.arrow_back,
            size: 32,
            color: Colors.black87,
          ),
        ),

        // -------------------------------
        // TITLE
        // -------------------------------

        title: Text(
          widget.letter,

          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        centerTitle: true,

        // -------------------------------
        // NEXT + SOUND
        // -------------------------------

        actions: [
          // NEXT BUTTON
          if (hasNextLetter)
            TextButton(
              onPressed: goToNext,

              child: const Text(
                "Next →",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),

          // SPEAKER
          IconButton(
            onPressed: () {
              TtsService.speak(widget.letter);
            },

            icon: const Icon(
              Icons.volume_up,
              size: 30,
              color: Colors.black87,
            ),
          ),

          const SizedBox(width: 5),
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
              widget.letter,

              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 2),

            // ===========================================
            // TRACING AREA
            // ===========================================

            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final double availableWidth =
                      constraints.maxWidth;

                  final double availableHeight =
                      constraints.maxHeight;

                  // Keep tracing area large,
                  // but fit inside mobile screen.
                  double tracingSize =
                      availableWidth * 0.82;

                  if (tracingSize >
                      availableHeight * 0.68) {
                    tracingSize =
                        availableHeight * 0.68;
                  }

                  // Minimum size
                  if (tracingSize < 280) {
                    tracingSize = 280;
                  }

                  return Stack(
                    alignment: Alignment.center,

                    children: [
                      // =================================
                      // WHITE TRACING PAPER
                      // =================================

                      Container(
                        width: tracingSize,
                        height: tracingSize,

                        decoration:
                            const BoxDecoration(
                          color: Colors.white,
                        ),

                        child: Center(
                          child: hasSvg

                              // =========================
                              // ALPHABET SVG
                              // =========================

                              ? SizedBox(
                                  width:
                                      tracingSize * 0.90,
                                  height:
                                      tracingSize * 0.90,

                                  child: DashedLetter(
                                    svgFile:
                                        "english/$svg",
                                  ),
                                )

                              // =========================
                              // NUMBER
                              // =========================

                              : Text(
                                  widget.letter,

                                  style: TextStyle(
                                    fontSize:
                                        tracingSize *
                                            0.70,

                                    fontWeight:
                                        FontWeight.bold,

                                    color: Colors
                                        .grey
                                        .shade300,
                                  ),
                                ),
                        ),
                      ),

                      // =================================
                      // DRAWING BOARD
                      // =================================

                      SizedBox(
                        width: tracingSize,
                        height: tracingSize,

                        child: DrawingBoard(),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}