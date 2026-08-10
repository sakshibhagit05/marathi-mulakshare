import 'package:flutter/material.dart';

import 'tracing_screen.dart';
import '../services/tts_service.dart';

class MulakshareScreen extends StatelessWidget {
  MulakshareScreen({super.key});

  // ==================================================
  // MARATHI AKSHAR GAT
  // ==================================================

  final List<Map<String, dynamic>> aksharGat = [
    {
      "title": "अक्षर गट १",
      "letters": ["क", "म", "ल", "आ", "अ"],
    },
    {
      "title": "अक्षर गट २",
      "letters": ["प", "र", "च", "व", "इ", "ई"],
    },
    {
      "title": "अक्षर गट ३",
      "letters": ["ग", "य", "झ", "भ", "ओ", "औ"],
    },
    {
      "title": "अक्षर गट ४",
      "letters": ["ट", "थ", "घ", "ण", "ज", "ओ"],
    },
    {
      "title": "अक्षर गट ५",
      "letters": ["ब", "न", "द", "ध", "उ", "ऊ"],
    },
    {
      "title": "अक्षर गट ६",
      "letters": ["त", "स", "ह", "ए", "ऐ"],
    },
    {
      "title": "अक्षर गट ७",
      "letters": [
        "श",
        "ष",
        "क्ष",
        "ज्ञ",
        "ओ",
        "अं",
        "अः",
      ],
    },
    {
      "title": "अक्षर गट ८",
      "letters": [
        "ड",
        "ढ",
        "फ",
        "ख",
        "छ",
      ],
    },
    {
      "title": "अक्षर गट ९",
      "letters": [
        "ङ",
        "ञ",
        "ळ",
        "ऋ",
      ],
    },
  ];

  // ==================================================
  // COLORS
  // ==================================================

  final List<Color> colors = [
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.red,
    Colors.teal,
    Colors.deepOrange,
    Colors.brown,
    Colors.indigo,
  ];

  // ==================================================
  // LETTER GRID
  // ==================================================

  Widget letterGrid(
    BuildContext context,
    List<String> letters,
  ) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: letters.length,

      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.9,
      ),

      itemBuilder: (context, index) {
        final String letter = letters[index];

        return Card(
          elevation: 5,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),

          child: InkWell(
            borderRadius: BorderRadius.circular(15),

            // ==========================================
            // OPEN TRACING
            // ==========================================

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TracingScreen(
                    letter: letter,

                    // Keep current group
                    groupLetters: letters,
                  ),
                ),
              );
            },

            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,

              children: [
                // ======================================
                // LARGE MARATHI LETTER
                // ======================================

                Text(
                  letter,

                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                // ======================================
                // SOUND
                // ======================================

                IconButton(
                  icon: const Icon(
                    Icons.volume_up,
                    color: Colors.green,
                    size: 30,
                  ),

                  onPressed: () {
                    TtsService.speak(letter);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ==================================================
  // BUILD
  // ==================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "मराठी मुळाक्षरे",

          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,

        backgroundColor: const Color(0xFFFFF7FF),

        elevation: 0,
      ),

      // =================================================
      // BODY
      // =================================================

      body: ListView.builder(
        padding: const EdgeInsets.all(16),

        itemCount: aksharGat.length,

        itemBuilder: (context, index) {
          final List<String> letters =
              List<String>.from(
            aksharGat[index]["letters"],
          );

          return Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              // ========================================
              // GROUP TITLE
              // ========================================

              Container(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 9,
                ),

                decoration: BoxDecoration(
                  color: colors[index],

                  borderRadius:
                      BorderRadius.circular(12),
                ),

                child: Text(
                  aksharGat[index]["title"],

                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // ========================================
              // LETTER GRID
              // ========================================

              letterGrid(
                context,
                letters,
              ),

              const SizedBox(height: 28),
            ],
          );
        },
      ),
    );
  }
}