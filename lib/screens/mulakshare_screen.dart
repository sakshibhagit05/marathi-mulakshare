import 'package:flutter/material.dart';

import 'tracing_screen.dart';
import 'vachanpath_screen.dart';
import '../services/tts_service.dart';
import 'shabd_khel_screen.dart';

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
  // VACHANPATH DATA 1 TO 9
  // ==================================================

  final List<List<String>> vachanpathData = [
    // वाचनपाठ १
    [
      "काका आला.",
      "मामा आला.",
      "लाला आला.",
      "काल आलम आला.",
    ],

    // वाचनपाठ २
    [
      "घार आली घार.",
      "रिमा घार बघ.",
      "बाबा घार बघा.",
      "मामा, मामी घार बघा.",
      "काका, काकी घार बघा.",
      "बघा बघा घार बघा.",
    ],

    // वाचनपाठ ३
    [
      "आला आला पाऊस आला.",
      "सरसर सरसर पाऊस आला.",
      "काका, काकू पाऊस बघा.",
      "कुमार, पूनम पाऊस बघा.",
      "आला आला पाऊस आला.",
    ],

    // वाचनपाठ ४
    [
      "सकाळ झाली.",
      "रतन, रमाने बाहेर पाला पाहिला.",
      "रमाने पाला सुपलीत उचलला.",
    ],

    // वाचनपाठ ५
    [
      "मुले सहलीला निघाली.",
      "रवीही सहलीला निघाला.",
      "आईने लाडू, चिवडा केला.",
      "चपाती व उसळ केली.",
      "गरम डबा दिला.",
      "आवडीची कैरी दिली.",
      "नगमा आली. वैदेही आली.",
      "सहलीची बस निघाली.",
    ],

    // वाचनपाठ ६
    [
      "जय व राज दोघे सोबती.",
      "शाळेतून घरी आले.",
      "दोघेही बागेत फिरायला गेले.",
      "फळझाडे व फुलझाडे पाहिली.",
      "फळे-फुले वेचून घेतली.",
      "मधाचे पोळे पाहिले.",
      "मोरही पाहिला.",
      "आजचा दिवस मजेत गेला.",
    ],

    // वाचनपाठ ७
    [
      "सौरभची आजी जेवण बनवते.",
      "चवदार भाजी करते.",
      "मुगाची खिचडी करते.",
      "पालकची भजी करते.",
      "नाचणीचे धिरडे करते.",
      "डाळीचे वडे करते.",
      "बाजरीची भाकरी खरपूस भाजते.",
      "रुचकर चवीची थाळी सजते.",
    ],

    // वाचनपाठ ८
    [
      "शिरीषने ठोकळे जमवले.",
      "काही चौरस काही आयत.",
      "शिरीषने ढिगातून ठोकळे घेतले.",
      "छान घर तयार केले. इमारत केली.",
      "शाळा केली. नागमोडी वाट केली.",
      "चढ उताराचा घाट केला.",
      "असे छान ठोकळे रचले.",
    ],

    // वाचनपाठ ९
    [
      "अँना भिलारला गेली. सोबत टॉम होता.",
      "भिलार म्हणजे पुस्तकांचे गाव.",
      "गावात होती पुस्तकेच पुस्तके.",
      "अँनाने एक पुस्तक घेतले.",
      "पुस्तकात खूप गोष्टी होत्या. छान चित्रे होती.",
      "अँना वाचू लागली. टॉम ऐकत होता.",
      "वाचताना तिला मजा आली.",
      "दोघेही खूश झाले.",
      "त्यांना भिलार गाव आवडले.",
    ],
  ];

  // ==================================================
  // LETTER GRID + ALL ACTIVITY BOXES
  // ==================================================

  Widget letterGrid(
    BuildContext context,
    List<String> letters,
    int groupIndex,
  ) {
    final List<Widget> items = [];

    // ==================================================
    // LETTER BOXES
    // ==================================================

    for (final letter in letters) {
      items.add(
        Card(
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
        ),
      );
    }

    // ==================================================
    // VACHANPATH BOX
    // EVERY GROUP
    // ==================================================

    items.add(
      Card(
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
                builder: (_) => VachanpathScreen(
                  pathNumber: groupIndex + 1,
                  sentences: vachanpathData[groupIndex],
                ),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.menu_book,
                color: colors[groupIndex],
                size: 50,
              ),
              const SizedBox(height: 8),
              Text(
                "वाचनपाठ–${groupIndex + 1}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: colors[groupIndex],
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "वाचा",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // ==================================================
    // GROUP 1
    // WORD OLKHA + VACHAA
    // ==================================================

    if (groupIndex == 0) {
      items.add(
        activityBox(
          context: context,
          icon: Icons.extension,
          title: "शब्द ओळखा",
          color: Colors.orange,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ShabdOlkhaScreen(),
              ),
            );
          },
        ),
      );

      items.add(
        activityBox(
          context: context,
          icon: Icons.menu_book_outlined,
          title: "वाचा",
          color: Colors.green,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const VachaaScreen(),
              ),
            );
          },
        ),
      );
    }

    // ==================================================
    // GROUP 2
    // VACH VA LIHI
    // ==================================================

    if (groupIndex == 1) {
      items.add(
        activityBox(
          context: context,
          icon: Icons.edit_note,
          title: "वाच व लिही",
          color: Colors.deepOrange,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const VachVaLihiScreen(),
              ),
            );
          },
        ),
      );
    }

    // ==================================================
    // GROUP 6
    // YOGYA GATATUN LIHI + NEW SHABD KHEL
    // ==================================================

    if (groupIndex == 5) {
      // -----------------------------------------------
      // 1. योग्य गटातून लिही
      // -----------------------------------------------

      items.add(
        activityBox(
          context: context,
          icon: Icons.edit_note,
          title: "वाच. योग्य गटातून लिही.",
          color: Colors.deepOrange,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => YogyaGatatunLihiScreen(),
              ),
            );
          },
        ),
      );

      // -----------------------------------------------
      // 2. NEW शब्दखेळ
      // -----------------------------------------------

      items.add(
        activityBox(
          context: context,
          icon: Icons.extension,
          title: "शब्दखेळ (तो, ती, ते)",
          color: Colors.pink,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ShabdKhelScreen(),
              ),
            );
          },
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        return items[index];
      },
    );
  }

  // ==================================================
  // ACTIVITY BOX
  // ==================================================

  Widget activityBox({
    required BuildContext context,
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 50,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "उपक्रम",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
          ],
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
              // LETTERS + ACTIVITY BOXES
              // ========================================

              letterGrid(
                context,
                letters,
                index,
              ),

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
// GROUP 2
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
// GROUP 1
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
// GROUP 1
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

// ======================================================
// YOGYA GATATUN LIHI SCREEN
// GROUP 6
// ======================================================

class YogyaGatatunLihiScreen extends StatelessWidget {
  YogyaGatatunLihiScreen({super.key});

  final List<String> words = [
    "मोर",
    "मोरनी",
    "घर",
    "शाळा",
    "बाग",
    "फळ",
    "फूल",
    "राजा",
    "राणी",
    "मुलगा",
    "मुलगी",
    "झाड",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FF),
      appBar: AppBar(
        title: const Text(
          "वाच. योग्य गटातून लिही.",
          style: TextStyle(
            fontSize: 23,
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
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE0F3),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.deepOrange,
                  width: 2,
                ),
              ),
              child: const Text(
                "वाच. योग्य गटातून लिही.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "खालील शब्द वाचा.",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: words.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (context, index) {
                final word = words[index];

                return InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    TtsService.speak(word);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? const Color(0xFFFFE7A8)
                          : const Color(0xFFD8F1E8),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                    ),
                    child: Text(
                      word,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 25),

            const Text(
              "🔊 शब्दावर टॅप करा आणि ऐका.",
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}