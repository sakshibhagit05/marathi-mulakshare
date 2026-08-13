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
  // COMMON ACTIVITY CARD
  // ==================================================

  Widget activityCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Center(
      child: SizedBox(
        width: 300,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 28,
          ),
          label: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
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
  // VACHANPATH 1
  // GROUP 1
  // ==================================================

  Widget vachanpath1Card(BuildContext context) {
    return activityCard(
      context,
      title: "वाचनपाठ–१",
      icon: Icons.menu_book,
      color: Colors.pink,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const Vachanpath1Screen(),
          ),
        );
      },
    );
  }

  // ==================================================
  // SHABD OLKHA
  // GROUP 1
  // ==================================================

  Widget shabdOlkhaCard(BuildContext context) {
    return activityCard(
      context,
      title: "शब्द ओळखा",
      icon: Icons.extension,
      color: Colors.orange,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ShabdOlkhaScreen(),
          ),
        );
      },
    );
  }

  // ==================================================
  // VACHAA
  // GROUP 1
  // ==================================================

  Widget vachaaCard(BuildContext context) {
    return activityCard(
      context,
      title: "वाचा",
      icon: Icons.menu_book_outlined,
      color: Colors.green,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const VachaaScreen(),
          ),
        );
      },
    );
  }

  // ==================================================
  // VACHANPATH 2
  // GROUP 2
  // ==================================================

  Widget vachanpath2Card(BuildContext context) {
    return activityCard(
      context,
      title: "वाचनपाठ–२",
      icon: Icons.menu_book,
      color: Colors.purple,
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
    );
  }

  // ==================================================
  // VACH VA LIHI
  // GROUP 2
  // ==================================================

  Widget vachVaLihiCard(BuildContext context) {
    return activityCard(
      context,
      title: "वाच व लिही",
      icon: Icons.edit_note,
      color: Colors.deepOrange,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const VachVaLihiScreen(),
          ),
        );
      },
    );
  }

  // ==================================================
  // VACHANPATH 6
  // GROUP 6
  // ==================================================

  Widget vachanpath6Card(BuildContext context) {
    return activityCard(
      context,
      title: "वाचनपाठ–६",
      icon: Icons.menu_book,
      color: Colors.blue,
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
    );
  }

  // ==================================================
  // योग्य गटातून लिही
  // GROUP 6
  // ==================================================

  Widget yogyaGatLihiCard(BuildContext context) {
    return activityCard(
      context,
      title: "योग्य गटातून लिही",
      icon: Icons.edit,
      color: Colors.teal,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const YogyaGatLihiScreen(),
          ),
        );
      },
    );
  }

  // ==================================================
  // शब्दखेळ (तो, ती, ते)
  // GROUP 6
  // ==================================================

  Widget shabdKhelCard(BuildContext context) {
    return activityCard(
      context,
      title: "शब्दखेळ (तो, ती, ते)",
      icon: Icons.extension,
      color: Colors.indigo,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ShabdKhelScreen(),
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

              // ========================================
              // GROUP 1
              //
              // वाचनपाठ १
              // शब्द ओळखा
              // वाचा
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
              // GROUP 2
              //
              // वाचनपाठ २
              // वाच व लिही
              // ========================================

              if (index == 1) ...[
                const SizedBox(height: 18),

                vachanpath2Card(context),

                const SizedBox(height: 12),

                vachVaLihiCard(context),
              ],

              // ========================================
              // GROUP 6
              //
              // वाचनपाठ ६
              // योग्य गटातून लिही
              // शब्दखेळ (तो, ती, ते)
              // ========================================

              if (index == 5) ...[
                const SizedBox(height: 18),

                vachanpath6Card(context),

                const SizedBox(height: 12),

                yogyaGatLihiCard(context),

                const SizedBox(height: 12),

                shabdKhelCard(context),
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
            Container(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE0F3),
                borderRadius:
                    BorderRadius.circular(18),
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

            ...words.map(
              (word) => Padding(
                padding:
                    const EdgeInsets.only(
                  bottom: 16,
                ),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(15),
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
                          textAlign:
                              TextAlign.center,
                          style:
                              const TextStyle(
                            fontSize: 32,
                            fontWeight:
                                FontWeight.bold,
                            color:
                                Colors.black87,
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

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFBEA),
                borderRadius:
                    BorderRadius.circular(18),
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
                    textAlign:
                        TextAlign.center,
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
// योग्य गटातून लिही SCREEN
// ======================================================

class YogyaGatLihiScreen extends StatelessWidget {
  const YogyaGatLihiScreen({super.key});

  final List<String> words = const [
    "तारा",
    "ससा",
    "हत्ती",
    "एरंड",
    "ऐन",
    "सागर",
    "हवा",
    "तेज",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFFFF8FF),

      appBar: AppBar(
        title: const Text(
          "योग्य गटातून लिही",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor:
            const Color(0xFFFFF0FA),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color:
                    const Color(0xFFD8F1E8),
                borderRadius:
                    BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.teal,
                  width: 2,
                ),
              ),
              child: const Text(
                "योग्य गटातून लिही",
                textAlign:
                    TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight:
                      FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              "खालील शब्द वाचा आणि योग्य गटात लिहा.",
              textAlign:
                  TextAlign.center,
              style: TextStyle(
                fontSize: 21,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            ...words.map(
              (word) => Padding(
                padding:
                    const EdgeInsets.only(
                  bottom: 14,
                ),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 17,
                  ),
                  decoration:
                      BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(
                      15,
                    ),
                    border: Border.all(
                      color: Colors.teal,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          word,
                          textAlign:
                              TextAlign.center,
                          style:
                              const TextStyle(
                            fontSize: 30,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),

                      IconButton(
                        icon: const Icon(
                          Icons.volume_up,
                          color:
                              Colors.green,
                          size: 32,
                        ),
                        onPressed: () {
                          TtsService
                              .speak(word);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color:
                    const Color(0xFFF0FFFA),
                borderRadius:
                    BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.teal,
                  width: 2,
                ),
              ),
              child: const Text(
                "✏️ शब्द योग्य अक्षर गटाखाली लिहा.",
                textAlign:
                    TextAlign.center,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight:
                      FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// शब्दखेळ (तो, ती, ते)
// ======================================================

class ShabdKhelScreen extends StatelessWidget {
  const ShabdKhelScreen({super.key});

  final List<Map<String, String>> shabdLekh =
      const [
    {
      "to": "ढगा",
      "ti": "बहिण",
      "te": "घर",
    },
    {
      "to": "मामा",
      "ti": "माई",
      "te": "कमळ",
    },
    {
      "to": "काका",
      "ti": "माला",
      "te": "पान",
    },
    {
      "to": "बाबा",
      "ti": "रमा",
      "te": "काम",
    },
  ];

  final List<String> shabdKhel = const [
    "आई",
    "माई",
    "घर",
    "कबीर",
    "मीरा",
    "रमा",
    "काकी",
    "बाबा",
    "करा",
    "माया",
    "घाम",
    "मामी",
    "वय",
    "घाई",
    "इरा",
    "काका",
    "रमाई",
    "माला",
    "बाई",
    "आली",
    "काल",
    "काम",
    "कमला",
    "बकरी",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFFFF8FF),

      appBar: AppBar(
        title: const Text(
          "शब्दखेळ (तो, ती, ते)",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor:
            const Color(0xFFFFF0FA),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 11,
              ),
              decoration: BoxDecoration(
                color:
                    const Color(0xFFFFE0F3),
                borderRadius:
                    BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.pink,
                  width: 2,
                ),
              ),
              child: const Text(
                "शब्दखेळ",
                style: TextStyle(
                  fontSize: 29,
                  fontWeight:
                      FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "वाचा व शब्द ओळखा.",
              style: TextStyle(
                fontSize: 22,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Container(
              padding:
                  const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color:
                    const Color(0xFFFFFBEA),
                borderRadius:
                    BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.pinkAccent,
                  width: 2,
                ),
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),
                itemCount:
                    shabdKhel.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1.45,
                ),
                itemBuilder:
                    (context, index) {
                  final word =
                      shabdKhel[index];

                  return InkWell(
                    borderRadius:
                        BorderRadius.circular(
                      8,
                    ),
                    onTap: () {
                      TtsService
                          .speak(word);
                    },
                    child: Container(
                      alignment:
                          Alignment.center,
                      decoration:
                          BoxDecoration(
                        color: index % 2 == 0
                            ? const Color(
                                0xFFFFE7A8,
                              )
                            : const Color(
                                0xFFD8F1E8,
                              ),
                        borderRadius:
                            BorderRadius
                                .circular(8),
                        border: Border.all(
                          color:
                              Colors.black26,
                        ),
                      ),
                      child: Text(
                        word,
                        textAlign:
                            TextAlign.center,
                        style:
                            const TextStyle(
                          fontSize: 21,
                          fontWeight:
                              FontWeight.bold,
                          color:
                              Colors.black87,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            Container(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color:
                    const Color(0xFFFFE0F3),
                borderRadius:
                    BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.pink,
                  width: 2,
                ),
              ),
              child: const Text(
                "शब्दलेख (तो, ती, ते)",
                textAlign:
                    TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight:
                      FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "वाचा. योग्य गटात लिहा.",
              style: TextStyle(
                fontSize: 22,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Container(
              decoration:
                  BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.pink,
                  width: 2,
                ),
                borderRadius:
                    BorderRadius.circular(10),
              ),
              child: Table(
                border:
                    TableBorder.all(
                  color: Colors.pink,
                  width: 1,
                ),
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                },
                children: [
                  const TableRow(
                    children: [
                      _TableCell(
                        text: "तो",
                        header: true,
                      ),
                      _TableCell(
                        text: "ती",
                        header: true,
                      ),
                      _TableCell(
                        text: "ते",
                        header: true,
                      ),
                    ],
                  ),
                  ...shabdLekh.map(
                    (row) => TableRow(
                      children: [
                        _TableCell(
                          text: row["to"]!,
                        ),
                        _TableCell(
                          text: row["ti"]!,
                        ),
                        _TableCell(
                          text: row["te"]!,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "🔊 शब्दावर टॅप करा आणि ऐका.",
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight:
                    FontWeight.bold,
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
            margin:
                const EdgeInsets.only(
              bottom: 14,
            ),
            shape:
                RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(16),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 14,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      word,
                      style:
                          const TextStyle(
                        fontSize: 32,
                        fontWeight:
                            FontWeight.bold,
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
                      TtsService
                          .speak(word);
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
            margin:
                const EdgeInsets.only(
              bottom: 14,
            ),
            shape:
                RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(16),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 18,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      sentence,
                      style:
                          const TextStyle(
                        fontSize: 28,
                        fontWeight:
                            FontWeight.bold,
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
                      TtsService
                          .speak(sentence);
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
// TABLE CELL
// ======================================================

class _TableCell extends StatelessWidget {
  final String text;
  final bool header;

  const _TableCell({
    required this.text,
    this.header = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        TtsService.speak(text);
      },
      child: Container(
        padding:
            const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 5,
        ),
        color: header
            ? const Color(0xFFFFE8F5)
            : Colors.white,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: header ? 24 : 20,
            fontWeight: header
                ? FontWeight.bold
                : FontWeight.w600,
            color: header
                ? Colors.pink
                : Colors.black87,
          ),
        ),
      ),
    );
  }
}