import 'package:flutter/material.dart';

import 'tracing_screen.dart';
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
  // VACHANPATH DATA
  // ==================================================

  final List<List<String>> vachanpathData = [
    // ==================================================
    // वाचनपाठ १
    // ==================================================

    [
      "काका आला.",
      "मामा आला.",
      "लाला आला.",
      "काल आलम आला.",
    ],

    // ==================================================
    // वाचनपाठ २
    // ==================================================

    [
      "घार आली घार.",
      "रिमा घार बघ.",
      "बाबा घार बघा.",
      "मामा, मामी घार बघा.",
      "काका, काकी घार बघा.",
      "बघा बघा घार बघा.",
    ],

    // ==================================================
    // वाचनपाठ ३
    // ==================================================

    [
      "आला आला पाऊस आला.",
      "सरसर सरसर पाऊस आला.",
      "काका, काकू पाऊस बघा.",
      "कुमार, पूनम पाऊस बघा.",
      "आला आला पाऊस आला.",
    ],

    // ==================================================
    // वाचनपाठ ४
    // ==================================================

    [
      "सकाळ झाली.",
      "रतन, रमाने बाहेर पाला पाहिला.",
      "रमाने पाला सुपलीत उचलला.",
    ],

    // ==================================================
    // वाचनपाठ ५
    // ==================================================

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

    // ==================================================
    // वाचनपाठ ६
    // ==================================================

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

    // ==================================================
    // वाचनपाठ ७
    // ==================================================

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

    // ==================================================
    // वाचनपाठ ८
    // ==================================================

    [
      "शिरीषने ठोकळे जमवले.",
      "काही चौरस काही आयत.",
      "शिरीषने ढिगातून ठोकळे घेतले.",
      "छान घर तयार केले. इमारत केली.",
      "शाळा केली. नागमोडी वाट केली.",
      "चढ उताराचा घाट केला.",
      "असे छान ठोकळे रचले.",
    ],

    // ==================================================
    // वाचनपाठ ९
    // ==================================================

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
  // LETTER GRID
  // ==================================================

  Widget letterGrid(
    BuildContext context,
    List<String> letters,
    int groupIndex,
  ) {
    // 5/6/7 letters + 1 Vachanpath card
    final int totalItems = letters.length + 1;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      itemCount: totalItems,

      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.9,
      ),

      itemBuilder: (context, index) {
        // ==================================================
        // VACHANPATH CARD
        // ==================================================

        if (index == letters.length) {
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
                    builder: (_) => VachanpathScreen(
                      pathNumber: groupIndex + 1,
                      sentences:
                          vachanpathData[groupIndex],
                    ),
                  ),
                );
              },

              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [
                  // Book Icon
                  Icon(
                    Icons.menu_book,
                    color: colors[groupIndex],
                    size: 50,
                  ),

                  const SizedBox(height: 8),

                  // Vachanpath Number
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
          );
        }

        // ==================================================
        // NORMAL LETTER CARD
        // ==================================================

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
              // LETTER + VACHANPATH GRID
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