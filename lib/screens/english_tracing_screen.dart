import 'package:flutter/material.dart';

import '../data/english_letter_mapping.dart';
import '../widgets/dashed_letter.dart';
import '../widgets/drawing_board.dart';
import '../services/tts_service.dart';

class EnglishTracingScreen extends StatefulWidget {
  final String letter;

  // A-Z किंवा 1-10 ची complete list
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

  int get currentIndex {
    if (widget.groupLetters.isEmpty) {
      return -1;
    }

    return widget.groupLetters.indexOf(widget.letter);
  }

  bool get hasNextLetter {
    return currentIndex >= 0 &&
        currentIndex < widget.groupLetters.length - 1;
  }

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

  void goBack() {
    Navigator.pop(context);
  }

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

  @override
  Widget build(BuildContext context) {
    final bool hasSvg =
        englishLetterToSvg.containsKey(widget.letter);

    final String svg =
        englishLetterToSvg[widget.letter] ?? "";

    return Scaffold(
      backgroundColor: const Color(0xFFF8F4E3),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF7FF),
        elevation: 0,
        automaticallyImplyLeading: false,

        leading: IconButton(
          onPressed: goBack,
          icon: const Icon(
            Icons.arrow_back,
            size: 32,
            color: Colors.black87,
          ),
        ),

        title: Text(
          widget.letter,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        centerTitle: true,

        actions: [
          // ==============================
          // NEXT BUTTON
          // ==============================

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

          // ==============================
          // SOUND BUTTON
          // ==============================

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

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, screenConstraints) {

            final double screenWidth =
                screenConstraints.maxWidth;

            final double screenHeight =
                screenConstraints.maxHeight;

            return Column(
              children: [

                // ==================================
                // TOP LETTER
                // ==================================

                SizedBox(
                  height: screenWidth < 600 ? 85 : 105,
                  child: Center(
                    child: Text(
                      widget.letter,
                      style: TextStyle(
                        fontSize:
                            screenWidth < 600 ? 70 : 85,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),

                // ==================================
                // TRACING AREA
                // ==================================

                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {

                      final double maxWidth =
                          constraints.maxWidth - 24;

                      final double maxHeight =
                          constraints.maxHeight - 10;

                      // Mobile मध्ये मोठे tracing area
                      double tracingSize =
                          maxWidth < maxHeight
                              ? maxWidth
                              : maxHeight;

                      // Screen प्रमाणे size
                      if (screenWidth < 600) {
                        tracingSize =
                            tracingSize.clamp(300.0, 520.0);
                      } else {
                        tracingSize =
                            tracingSize.clamp(350.0, 650.0);
                      }

                      // उपलब्ध जागेपेक्षा मोठे होऊ नये
                      tracingSize =
                          tracingSize.clamp(
                        280.0,
                        maxWidth,
                      );

                      tracingSize =
                          tracingSize.clamp(
                        280.0,
                        maxHeight,
                      );

                      return Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [

                            // =================================
                            // WHITE TRACING PAPER
                            // =================================

                            Container(
                              width: tracingSize,
                              height: tracingSize,

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(4),
                              ),

                              child: Center(
                                child: hasSvg
                                    ? SizedBox(
                                        width:
                                            tracingSize * 0.92,
                                        height:
                                            tracingSize * 0.92,

                                        child: DashedLetter(
                                          svgFile:
                                              "english/$svg",
                                        ),
                                      )

                                    // =========================
                                    // NUMBERS
                                    // =========================

                                    : Text(
                                        widget.letter,
                                        style: TextStyle(
                                          fontSize:
                                              tracingSize * 0.72,
                                          fontWeight:
                                              FontWeight.bold,
                                          color:
                                              Colors.grey.shade300,
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