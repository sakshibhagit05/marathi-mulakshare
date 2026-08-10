import 'package:flutter/material.dart';

import '../widgets/drawing_board.dart';
import '../widgets/dashed_letter.dart';
import '../data/marathi_letter_mapping.dart';
import '../services/tts_service.dart';

class TracingScreen extends StatefulWidget {
  final String letter;

  // Current list/group
  final List<String> groupLetters;

  const TracingScreen({
    super.key,
    required this.letter,
    this.groupLetters = const [],
  });

  @override
  State<TracingScreen> createState() => _TracingScreenState();
}

class _TracingScreenState extends State<TracingScreen> {
  // =====================================================
  // INITIALIZE
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
  // GET SVG FILE
  // =====================================================

  String getSvgFile(String letter) {
    if (letterToSvg.containsKey(letter)) {
      return letterToSvg[letter]!;
    }

    if (barakhadiToSvg.containsKey(letter)) {
      return barakhadiToSvg[letter]!;
    }

    return "ka.svg";
  }

  // =====================================================
  // CHECK SVG
  // =====================================================

  bool get hasSvg {
    return letterToSvg.containsKey(widget.letter) ||
        barakhadiToSvg.containsKey(widget.letter);
  }

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
        currentIndex < widget.groupLetters.length - 1;
  }

  // =====================================================
  // BACK
  //
  // Back should NOT open previous tracing letter.
  //
  // It should go out of tracing and return to the
  // first/main page of the app.
  // =====================================================

  void goBack() {
    Navigator.of(context).popUntil(
      (route) => route.isFirst,
    );
  }

  // =====================================================
  // NEXT
  // =====================================================

  void goToNextLetter() {
    if (!hasNextLetter) {
      return;
    }

    final String nextLetter =
        widget.groupLetters[currentIndex + 1];

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return TracingScreen(
            letter: nextLetter,

            // Keep the SAME group/list
            groupLetters: widget.groupLetters,
          );
        },
      ),
    );
  }

  // =====================================================
  // BUILD
  // =====================================================

  @override
  Widget build(BuildContext context) {
    final String svgFile =
        getSvgFile(widget.letter);

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
        // BACK - TOP LEFT
        // -----------------------------------------------

        leading: IconButton(
          onPressed: goBack,

          icon: const Icon(
            Icons.arrow_back,
            size: 34,
            color: Colors.black87,
          ),
        ),

        // -----------------------------------------------
        // CURRENT LETTER
        // -----------------------------------------------

        title: Text(
          widget.letter,

          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        centerTitle: true,

        // -----------------------------------------------
        // NEXT + SPEAKER
        // -----------------------------------------------

        actions: [
          if (hasNextLetter)
            TextButton(
              onPressed: goToNextLetter,

              child: const Text(
                "Next →",

                style: TextStyle(
                  fontSize: 21,
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
              size: 31,
              color: Colors.black87,
            ),
          ),

          const SizedBox(width: 8),
        ],
      ),

      // =================================================
      // BODY
      // =================================================

      body: Container(
        width: double.infinity,

        color: const Color(0xFFF8F4E3),

        child: Column(
          children: [
            // ==========================================
            // LARGE LETTER
            // ==========================================

            const SizedBox(height: 5),

            Text(
              widget.letter,

              style: const TextStyle(
                fontSize: 90,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 0),

            // ==========================================
            // TRACING AREA
            // ==========================================

            Expanded(
              child: Stack(
                alignment: Alignment.center,

                children: [
                  // --------------------------------------
                  // LARGE DASHED LETTER
                  // --------------------------------------

                  if (hasSvg)
                    SizedBox(
                      width: 500,
                      height: 500,

                      child: DashedLetter(
                        svgFile: svgFile,
                      ),
                    )
                  else
                    Text(
                      widget.letter,

                      style: TextStyle(
                        fontSize: 400,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade300,
                      ),
                    ),

                  // --------------------------------------
                  // DRAWING BOARD
                  // --------------------------------------

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