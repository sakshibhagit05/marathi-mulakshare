import 'package:flutter/material.dart';

import 'tracing_screen.dart';
import 'vachanpath_1_screen.dart';
import 'vachanpath_screen.dart';
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TracingScreen(
                    letter: letter,
                    groupLetters: letters,
                  ),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  letter,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
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
  // VACHANPATH 1 CARD
  // ==================================================

  Widget vachanpath1Card(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Vachanpath1Screen(),
              ),
            );
          },
          icon: const Icon(
            Icons.menu_book,
            size: 28,
          ),
          label: const Text(
            "वाचनपाठ–१",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
          ),
        ),
      ),
    );
  }

  // ==================================================
  // VACHANPATH 2 CARD
  // ==================================================

  Widget vachanpath2Card(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const VachanpathScreen(
                  pathNumber: 2,
                  sentences: [
                    "रिमा घरी आली.",
                    "कमी किलबिल झाली.",
                    "लीला घरी आली.",
                    "बिरबल आला.",
                  ],
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.menu_book,
            size: 28,
          ),
          label: const Text(
            "वाचनपाठ–२",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
          ),
        ),
      ),
    );
  }

  // ==================================================
  // VACHANPATH 6 CARD
  // ==================================================

  Widget vachanpath6Card(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const VachanpathScreen(
                  pathNumber: 6,
                  sentences: [
                    "जय व राजा दोघे सोबती.",
                    "शाळेतून घरी आले.",
                    "दोघेही बागेत फिरायला गेले.",
                    "फणसझाडे व फुलझाडे पाहिली.",
                    "फळे-फुले वेचून घेतली.",
                    "मधाचे पोळे पाहिले.",
                    "मोरही पाहिला.",
                    "आजचा दिवस मजेत गेला.",
                  ],
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.menu_book,
            size: 28,
          ),
          label: const Text(
            "वाचनपाठ–६",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
          ),
        ),
      ),
    );
  }

  // ==================================================
  // SHABD OLKHA CARD
  // ONLY GROUP 1
  // ==================================================

  Widget shabdOlkhaCard(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ShabdOlkhaScreen(),
              ),
            );
          },
          icon: const Icon(
            Icons.extension,
            size: 28,
          ),
          label: const Text(
            "शब्द ओळखा",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
          ),
        ),
      ),
    );
  }

  // ==================================================
  // VACHAA CARD
  // ONLY GROUP 1
  // ==================================================

  Widget vachaaCard(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const VachaaScreen(),
              ),
            );
          },
          icon: const Icon(
            Icons.menu_book_outlined,
            size: 28,
          ),
          label: const Text(
            "वाचा",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
          ),
        ),
      ),
    );
  }

  // ==================================================
  // VACH VA LIHI CARD
  // ONLY GROUP 2
  // ==================================================

  Widget vachVaLihiCard(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const VachVaLihiScreen(),
              ),
            );
          },
          icon: const Icon(
            Icons.edit_note,
            size: 30,
          ),
          label: const Text(
            "वाच व लिही",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
          ),
        ),
      ),
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

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: aksharGat.length,
        itemBuilder: (context, index) {
          final List<String> letters =
              List<String>.from(
            aksharGat[index]["letters"],
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ========================================
              // GROUP TITLE
              // ========================================

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: colors[index],
                  borderRadius: BorderRadius.circular(12),
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

              // ========================================
              // GROUP 1 ACTIVITIES
              // ========================================

              if (index == 0) ...[
                const SizedBox(height: 18),

                vachanpath1Card(context),

                const SizedBox(height: 12),

                shabdOlkhaCard(context),

                const SizedBox(height: 12),

                vachaaCard(context),
              ],

              // ========================================
              // GROUP 2 ACTIVITIES
              // ========================================

              if (index == 1) ...[
                const SizedBox(height: 18),

                // -------------------------------
                // VACHANPATH 2
                // -------------------------------

                vachanpath2Card(context),

                const SizedBox(height: 12),

                // -------------------------------
                // VACH VA LIHI
                // -------------------------------

                vachVaLihiCard(context),
              ],

              const SizedBox(height: 28),
            ],
          );
        },
      ),
    );
  }
}

// ======================================================
// VACH VA LIHI SCREEN
// ======================================================

class VachVaLihiScreen extends StatelessWidget {
  const VachVaLihiScreen({super.key});

  final List<String> words = const [
    "रिमा",
    "घरी",
    "कमी",
    "किलबिल",
    "लीला",
    "बिरबल",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FF),

      appBar: AppBar(
        title: const Text(
          "वाच व लिही",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFF0FA),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            // ==========================================
            // TITLE
            // ==========================================

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE0F3),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.pink,
                  width: 2,
                ),
              ),
              child: const Text(
                "वाच व लिही",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "खालील शब्द वाचा.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            // ==========================================
            // WORDS
            // ==========================================

            ...words.map(
              (word) => Padding(
                padding: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.orange,
                      width: 2,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 3),
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          word,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),

                      IconButton(
                        icon: const Icon(
                          Icons.volume_up,
                          size: 32,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          TtsService.speak(word);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // ==========================================
            // WRITING AREA
            // ==========================================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFBEA),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.green,
                  width: 2,
                ),
              ),
              child: const Column(
                children: [
                  Text(
                    "✏️ शब्द वही लिहा.",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    "रिमा\n"
                    "घरी\n"
                    "कमी\n"
                    "किलबिल\n"
                    "लीला\n"
                    "बिरबल",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      height: 2,
                      color: Colors.black45,
                    ),
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

// ======================================================
// SHABD OLKHA SCREEN
// ======================================================

class ShabdOlkhaScreen extends StatelessWidget {
  const ShabdOlkhaScreen({super.key});

  final List<String> words = const [
    "लाला",
    "मका",
    "काल",
    "कमल",
    "आला",
    "मलम",
    "काम",
    "कमला",
    "लाल",
    "मामा",
    "कला",
    "आलम",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "शब्द ओळखा",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: words.length,
        itemBuilder: (context, index) {
          final word = words[index];

          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 14,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      word,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.volume_up,
                      size: 32,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      TtsService.speak(word);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ======================================================
// VACHAA SCREEN
// ======================================================

class VachaaScreen extends StatelessWidget {
  const VachaaScreen({super.key});

  final List<String> words = const [
    "काका आला.",
    "मामा आला.",
    "लाला आला.",
    "काका कमळ आण.",
    "माला लाल कमळ.",
    "मला कमळ आवडते.",
    "आला मामा आला.",
    "कमल आला.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "वाचा",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: words.length,
        itemBuilder: (context, index) {
          final sentence = words[index];

          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 18,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      sentence,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.volume_up,
                      size: 32,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      TtsService.speak(sentence);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}