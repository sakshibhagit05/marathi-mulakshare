import 'package:flutter/material.dart';
import '../services/tts_service.dart';

class VachanpathScreen extends StatelessWidget {
  final int pathNumber;
  final List<String> sentences;

  const VachanpathScreen({
    super.key,
    required this.pathNumber,
    required this.sentences,
  });

  // =========================================================
  // शब्दखेळ
  // =========================================================

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

  // =========================================================
  // शब्दलेख
  // =========================================================

  final List<Map<String, String>> shabdLekh = const [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FF),

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: Text(
          "वाचनपाठ–$pathNumber",
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        centerTitle: true,
        backgroundColor: const Color(0xFFFFF0FA),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),

        child: Column(
          children: [

            // =================================================
            // TITLE
            // =================================================

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 12,
              ),

              decoration: BoxDecoration(
                color: const Color(0xFFFFE4F1),
                borderRadius: BorderRadius.circular(20),

                border: Border.all(
                  color: Colors.pink,
                  width: 2,
                ),
              ),

              child: Text(
                "वाचनपाठ–$pathNumber",
                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ),

            const SizedBox(height: 35),

            // =================================================
            // READING SENTENCES
            // =================================================

            ...sentences.map(
              (sentence) => Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),

                child: Align(
                  alignment: Alignment.centerLeft,

                  child: Text(
                    sentence,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                  ),
                ),
              ),
            ),

            // =================================================
            // ONLY FOR VACHANPATH 6
            // =================================================

            if (pathNumber == 6) ...[
              const SizedBox(height: 25),

              // =================================================
              // शब्दखेळ TITLE
              // =================================================

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xFFFFD6F0),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.pink,
                    width: 2,
                  ),
                ),

                child: const Text(
                  "शब्दखेळ",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "वाचा व शब्द ओळखा.",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // =================================================
              // WORD PUZZLE GRID
              // =================================================

              Container(
                padding: const EdgeInsets.all(12),

                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBEA),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.pinkAccent,
                    width: 2,
                  ),
                ),

                child: GridView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(),

                  itemCount: shabdKhel.length,

                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1.45,
                  ),

                  itemBuilder: (context, index) {
                    final word = shabdKhel[index];

                    return InkWell(
                      borderRadius:
                          BorderRadius.circular(8),

                      onTap: () {
                        TtsService.speak(word);
                      },

                      child: Container(
                        alignment: Alignment.center,

                        decoration: BoxDecoration(
                          color: index % 2 == 0
                              ? const Color(0xFFFFE7A8)
                              : const Color(0xFFD8F1E8),

                          borderRadius:
                              BorderRadius.circular(8),

                          border: Border.all(
                            color: Colors.black26,
                          ),
                        ),

                        child: Text(
                          word,
                          textAlign: TextAlign.center,

                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 35),

              // =================================================
              // शब्दलेख TITLE
              // =================================================

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 10,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xFFFFE0F3),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.pink,
                    width: 2,
                  ),
                ),

                child: const Text(
                  "शब्दलेख (तो, ती, ते)",
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "वाचा. योग्य गटात लिहा.",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // =================================================
              // WORD LEKH TABLE
              // =================================================

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.pink,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Table(
                  border: TableBorder.all(
                    color: Colors.pink,
                    width: 1,
                  ),

                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                  },

                  children: [

                    // HEADER
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

                    // WORDS
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
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}


// =============================================================
// TABLE CELL
// =============================================================

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
        padding: const EdgeInsets.symmetric(
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
            fontWeight:
                header ? FontWeight.bold : FontWeight.w600,
            color:
                header ? Colors.pink : Colors.black87,
          ),
        ),
      ),
    );
  }
}