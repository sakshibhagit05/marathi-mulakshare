import 'package:flutter/material.dart';
import '../services/tts_service.dart';

class ShabdKhelScreen extends StatefulWidget {
  const ShabdKhelScreen({super.key});

  @override
  State<ShabdKhelScreen> createState() => _ShabdKhelScreenState();
}

class _ShabdKhelScreenState extends State<ShabdKhelScreen> {
  // ============================================================
  // WORDS
  // ============================================================

  final List<String> allWords = [
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

  // ============================================================
  // CORRECT ANSWERS
  // ============================================================

  final Map<String, String> correctGroups = {
    // तो
    "कबीर": "तो",
    "बाबा": "तो",
    "करा": "तो",
    "घाम": "तो",
    "काका": "तो",
    "काल": "तो",
    "काम": "तो",

    // ती
    "आई": "ती",
    "माई": "ती",
    "मीरा": "ती",
    "रमा": "ती",
    "काकी": "ती",
    "माया": "ती",
    "मामी": "ती",
    "घाई": "ती",
    "इरा": "ती",
    "रमाई": "ती",
    "माला": "ती",
    "बाई": "ती",
    "आली": "ती",
    "कमला": "ती",
    "बकरी": "ती",

    // ते
    "घर": "ते",
    "वय": "ते",
  };

  // ============================================================
  // WORDS WHICH ARE ALREADY PLACED
  // ============================================================

  final Map<String, List<String>> placedWords = {
    "तो": [],
    "ती": [],
    "ते": [],
  };

  // ============================================================
  // CHECK WHETHER WORD IS ALREADY PLACED
  // ============================================================

  bool isPlaced(String word) {
    return placedWords.values.any(
      (list) => list.contains(word),
    );
  }

  // ============================================================
  // DROP WORD
  // ============================================================

  void dropWord(String word, String targetGroup) {
    final correctGroup = correctGroups[word];

    // ------------------------------------------------------------
    // CORRECT
    // ------------------------------------------------------------

    if (correctGroup == targetGroup) {
      setState(() {
        placedWords[targetGroup]!.add(word);
      });

      TtsService.speak(word);

      // ----------------------------------------------------------
      // ALL WORDS COMPLETED
      // ----------------------------------------------------------

      if (placedWords.values
              .expand((element) => element)
              .length ==
          allWords.length) {
        Future.delayed(
          const Duration(milliseconds: 400),
          () {
            if (!mounted) return;

            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(
                    "🎉 छान!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  content: const Text(
                    "सर्व शब्द योग्य गटात ठेवले!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  actions: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "ठीक आहे",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      }
    }

    // ------------------------------------------------------------
    // WRONG
    // ------------------------------------------------------------

    else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "❌ पुन्हा प्रयत्न करा!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          duration: Duration(milliseconds: 900),
        ),
      );
    }
  }

  // ============================================================
  // RESET GAME
  // ============================================================

  void resetGame() {
    setState(() {
      placedWords["तो"]!.clear();
      placedWords["ती"]!.clear();
      placedWords["ते"]!.clear();
    });
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FF),

      // ========================================================
      // APP BAR
      // ========================================================

      appBar: AppBar(
        title: const Text(
          "शब्दखेळ (तो, ती, ते)",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFF0FA),
        elevation: 0,

        actions: [
          IconButton(
            tooltip: "पुन्हा सुरू करा",
            icon: const Icon(
              Icons.refresh,
              size: 30,
            ),
            onPressed: resetGame,
          ),
        ],
      ),

      // ========================================================
      // BODY
      // ========================================================

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),

        child: Column(
          children: [

            // ====================================================
            // TITLE
            // ====================================================

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

            const SizedBox(height: 15),

            // ====================================================
            // INSTRUCTION
            // ====================================================

            const Text(
              "शब्द उचला आणि योग्य गटात ठेवा.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "शब्दावर क्लिक न करता तो पकडा आणि खाली ओढा.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 20),

            // ====================================================
            // WORDS AREA
            // ====================================================

            Container(
              width: double.infinity,

              padding: const EdgeInsets.fromLTRB(
                15,
                12,
                15,
                18,
              ),

              decoration: BoxDecoration(
                color: const Color(0xFFFFFBEA),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.pinkAccent,
                  width: 2,
                ),
              ),

              child: Column(
                children: [

                  const Text(
                    "शब्द",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // =================================================
                  // DRAGGABLE WORDS
                  // =================================================

                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 12,

                    children: allWords
                        .where((word) => !isPlaced(word))
                        .map(
                          (word) => _buildDraggableWord(word),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ====================================================
            // DROP ZONES
            // ====================================================

            LayoutBuilder(
              builder: (context, constraints) {

                // Desktop / Web
                if (constraints.maxWidth >= 800) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildDropZone(
                          title: "तो",
                          color: Colors.deepOrange,
                          headerColor: const Color(0xFFFFE8DE),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: _buildDropZone(
                          title: "ती",
                          color: Colors.pink,
                          headerColor: const Color(0xFFFFE8F5),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: _buildDropZone(
                          title: "ते",
                          color: Colors.blue,
                          headerColor: const Color(0xFFE3F2FD),
                        ),
                      ),
                    ],
                  );
                }

                // Mobile
                return Column(
                  children: [
                    _buildDropZone(
                      title: "तो",
                      color: Colors.deepOrange,
                      headerColor: const Color(0xFFFFE8DE),
                    ),

                    const SizedBox(height: 15),

                    _buildDropZone(
                      title: "ती",
                      color: Colors.pink,
                      headerColor: const Color(0xFFFFE8F5),
                    ),

                    const SizedBox(height: 15),

                    _buildDropZone(
                      title: "ते",
                      color: Colors.blue,
                      headerColor: const Color(0xFFE3F2FD),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 25),

            // ====================================================
            // HELP TEXT
            // ====================================================

            const Text(
              "☝️ शब्द पकडा → योग्य गटात ओढा → सोडा",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // DRAGGABLE WORD
  // ============================================================

  Widget _buildDraggableWord(String word) {
    return Draggable<String>(
      data: word,

      // ----------------------------------------------------------
      // WHILE DRAGGING
      // ----------------------------------------------------------

      feedback: Material(
        color: Colors.transparent,

        child: Container(
          width: 125,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 12,
          ),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.pink,
              width: 3,
            ),
            boxShadow: const [
              BoxShadow(
                blurRadius: 8,
                offset: Offset(0, 4),
                color: Colors.black26,
              ),
            ],
          ),

          child: Text(
            word,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ),

      // ----------------------------------------------------------
      // ORIGINAL WORD WHILE DRAGGING
      // ----------------------------------------------------------

      childWhenDragging: Opacity(
        opacity: 0.25,

        child: _wordCard(word),
      ),

      // ----------------------------------------------------------
      // NORMAL WORD
      // ----------------------------------------------------------

      child: _wordCard(word),

      // ----------------------------------------------------------
      // DRAG START
      // ----------------------------------------------------------

      onDragStarted: () {
        TtsService.speak(word);
      },
    );
  }

  // ============================================================
  // WORD CARD
  // ============================================================

  Widget _wordCard(String word) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 105,
        maxWidth: 150,
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 12,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),

        border: Border.all(
          color: Colors.pink,
          width: 2,
        ),

        boxShadow: const [
          BoxShadow(
            blurRadius: 3,
            offset: Offset(0, 2),
            color: Colors.black12,
          ),
        ],
      ),

      child: Text(
        word,
        textAlign: TextAlign.center,

        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  // ============================================================
  // DROP ZONE
  // ============================================================

  Widget _buildDropZone({
    required String title,
    required Color color,
    required Color headerColor,
  }) {
    return DragTarget<String>(
      // ----------------------------------------------------------
      // WHEN WORD IS DRAGGED OVER BOX
      // ----------------------------------------------------------

      onWillAcceptWithDetails: (details) {
        return true;
      },

      // ----------------------------------------------------------
      // WORD DROPPED
      // ----------------------------------------------------------

      onAcceptWithDetails: (details) {
        dropWord(
          details.data,
          title,
        );
      },

      // ----------------------------------------------------------
      // DROP ZONE UI
      // ----------------------------------------------------------

      builder: (
        context,
        candidateData,
        rejectedData,
      ) {
        final bool isHovering = candidateData.isNotEmpty;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 150),

          width: double.infinity,
          height: 400,

          decoration: BoxDecoration(
            color: isHovering
                ? headerColor.withOpacity(0.35)
                : Colors.white,

            borderRadius: BorderRadius.circular(15),

            border: Border.all(
              color: color,
              width: isHovering ? 4 : 2,
            ),

            boxShadow: [
              BoxShadow(
                blurRadius: isHovering ? 10 : 4,
                offset: const Offset(0, 3),
                color: Colors.black12,
              ),
            ],
          ),

          child: Column(
            children: [

              // ==================================================
              // HEADER
              // ==================================================

              Container(
                width: double.infinity,

                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                ),

                decoration: BoxDecoration(
                  color: headerColor,

                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(13),
                    topRight: Radius.circular(13),
                  ),
                ),

                child: Text(
                  title,
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),

              // ==================================================
              // WORDS PLACED INSIDE
              // ==================================================

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),

                  child: placedWords[title]!.isEmpty
                      ? Center(
                          child: Text(
                            isHovering
                                ? "इथे सोडा"
                                : "इथे शब्द ठेवा",

                            textAlign: TextAlign.center,

                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                              color: isHovering
                                  ? color
                                  : Colors.black26,
                            ),
                          ),
                        )
                      : SingleChildScrollView(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 8,
                            runSpacing: 8,

                            children: placedWords[title]!
                                .map(
                                  (word) => Container(
                                    padding:
                                        const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),

                                    decoration: BoxDecoration(
                                      color: headerColor,
                                      borderRadius:
                                          BorderRadius.circular(10),

                                      border: Border.all(
                                        color: color,
                                        width: 1.5,
                                      ),
                                    ),

                                    child: Text(
                                      word,

                                      style: const TextStyle(
                                        fontSize: 21,
                                        fontWeight:
                                            FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}