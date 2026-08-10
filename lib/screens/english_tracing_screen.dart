import 'package:flutter/material.dart';

import '../data/english_letter_mapping.dart';
import '../widgets/dashed_letter.dart';
import '../widgets/drawing_board.dart';
import '../services/tts_service.dart';

class EnglishTracingScreen extends StatefulWidget {
  final String letter;

  // A-Z किंवा 1-10 ची complete list
  final List groupLetters;

  const EnglishTracingScreen({
    super.key,
    required this.letter,
    this.groupLetters = const [],
  });

  @override
  State<EnglishTracingScreen> createState() =>
      _EnglishTracingScreenState();
}

class _EnglishTracingScreenState extends State<EnglishTracingScreen> {
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
    return currentIndex >= 0 &&
        currentIndex < widget.groupLetters.length - 1;
  }

  // =====================================================
  // NEXT
  // =====================================================

  void goToNext() {
    if (!hasNextLetter) return;

    final String nextLetter =
        widget.groupLetters[currentIndex + 1];

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => EnglishTracingScreen(
          letter: nextLetter,
          groupLetters: widget.groupLetters,
        ),
      ),
    );
  }

  // =====================================================
  // BACK
  // =====================================================

  void goBack() {
    Navigator.pop(context);
  }

  // =====================================================
  // INITIAL SPEECH
  // =====================================================

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(milliseconds: 400),
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
        backgroundColor: const Color(0xFFFFF7FF),
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
        child: LayoutBuilder(
          builder: (context, screenConstraints) {
            final double screenWidth =
                screenConstraints.maxWidth;

            return Column(
              children: [
                // ========================================
                // TOP LETTER
                // ========================================

                SizedBox(
                  height: screenWidth < 600 ? 75 : 95,
                  child: Center(
                    child: Text(
                      widget.letter,
                      style: TextStyle(
                        fontSize:
                            screenWidth < 600 ? 65 : 80,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),

                // ========================================
                // TRACING AREA
                // ========================================

                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      // Available width
                      final double availableWidth =
                          constraints.maxWidth - 16;

                      // Available height
                      final double availableHeight =
                          constraints.maxHeight - 10;

                      // Choose the smaller dimension
                      double tracingSize =
                          availableWidth < availableHeight
                              ? availableWidth
                              : availableHeight;

                      // ==================================
                      // MOBILE SIZE
                      // ==================================

                      if (screenWidth < 600) {
                        tracingSize = tracingSize.clamp(
                          280.0,
                          500.0,
                        );
                      }

                      // ==================================
                      // DESKTOP SIZE
                      // ==================================

                      else {
                        tracingSize = tracingSize.clamp(
                          350.0,
                          650.0,
                        );
                      }

                      // Never exceed available space
                      tracingSize =
                          tracingSize.clamp(
                        260.0,
                        availableWidth,
                      );

                      tracingSize =
                          tracingSize.clamp(
                        260.0,
                        availableHeight,
                      );

                      return Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // ==================================
                            // WHITE TRACING PAPER
                            // ==================================

                            Container(
                              width: tracingSize,
                              height: tracingSize,

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(6),

                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 1,
                                ),
                              ),

                              child: Center(
                                child: hasSvg

                                    // ==================================
                                    // LARGE SVG LETTER
                                    // ==================================

                                    ? DashedLetter(
                                        svgFile:
                                            "english/$svg",

                                        // IMPORTANT:
                                        // SVG now grows with tracing area
                                        size:
                                            tracingSize * 0.96,
                                      )

                                    // ==================================
                                    // LARGE NUMBER
                                    // ==================================

                                    : Text(
                                        widget.letter,
                                        style: TextStyle(
                                          fontSize:
                                              tracingSize *
                                                  0.78,
                                          fontWeight:
                                              FontWeight.bold,
                                          color: Colors
                                              .grey
                                              .shade300,
                                        ),
                                      ),
                              ),
                            ),

                            // ==================================
                            // DRAWING BOARD
                            // ==================================

                            SizedBox(
                              width: tracingSize,
                              height: tracingSize,
                              child: DrawingBoard(),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}