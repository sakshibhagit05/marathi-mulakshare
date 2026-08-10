import 'package:flutter/material.dart';

import 'tracing_screen.dart';
import '../services/tts_service.dart';

class BarakhadiDetailScreen extends StatelessWidget {
  final String letter;

  const BarakhadiDetailScreen({
    super.key,
    required this.letter,
  });

  // ==================================================
  // GET BARAKHADI
  // ==================================================

  List<String> getBarakhadi(String letter) {
    final Map<String, List<String>> barakhadi = {
      "क": [
        "क",
        "का",
        "कि",
        "की",
        "कु",
        "कू",
        "के",
        "कै",
        "को",
        "कौ",
        "कं",
        "कः"
      ],

      "ख": [
        "ख",
        "खा",
        "खि",
        "खी",
        "खु",
        "खू",
        "खे",
        "खै",
        "खो",
        "खौ",
        "खं",
        "खः"
      ],

      "ग": [
        "ग",
        "गा",
        "गि",
        "गी",
        "गु",
        "गू",
        "गे",
        "गै",
        "गो",
        "गौ",
        "गं",
        "गः"
      ],

      "घ": [
        "घ",
        "घा",
        "घि",
        "घी",
        "घु",
        "घू",
        "घे",
        "घै",
        "घो",
        "घौ",
        "घं",
        "घः"
      ],

      "च": [
        "च",
        "चा",
        "चि",
        "ची",
        "चु",
        "चू",
        "चे",
        "चै",
        "चो",
        "चौ",
        "चं",
        "चः"
      ],

      "छ": [
        "छ",
        "छा",
        "छि",
        "छी",
        "छु",
        "छू",
        "छे",
        "छै",
        "छो",
        "छौ",
        "छं",
        "छः"
      ],

      "ज": [
        "ज",
        "जा",
        "जि",
        "जी",
        "जु",
        "जू",
        "जे",
        "जै",
        "जो",
        "जौ",
        "जं",
        "जः"
      ],

      "ट": [
        "ट",
        "टा",
        "टि",
        "टी",
        "टु",
        "टू",
        "टे",
        "टै",
        "टो",
        "टौ",
        "टं",
        "टः"
      ],

      "ठ": [
        "ठ",
        "ठा",
        "ठि",
        "ठी",
        "ठु",
        "ठू",
        "ठे",
        "ठै",
        "ठो",
        "ठौ",
        "ठं",
        "ठः"
      ],

      "त": [
        "त",
        "ता",
        "ति",
        "ती",
        "तु",
        "तू",
        "ते",
        "तै",
        "तो",
        "तौ",
        "तं",
        "तः"
      ],

      "थ": [
        "थ",
        "था",
        "थि",
        "थी",
        "थु",
        "थू",
        "थे",
        "थै",
        "थो",
        "थौ",
        "थं",
        "थः"
      ],

      "प": [
        "प",
        "पा",
        "पि",
        "पी",
        "पु",
        "पू",
        "पे",
        "पै",
        "पो",
        "पौ",
        "पं",
        "पः"
      ],

      "फ": [
        "फ",
        "फा",
        "फि",
        "फी",
        "फु",
        "फू",
        "फे",
        "फै",
        "फो",
        "फौ",
        "फं",
        "फः"
      ],

      "ब": [
        "ब",
        "बा",
        "बि",
        "बी",
        "बु",
        "बू",
        "बे",
        "बै",
        "बो",
        "बौ",
        "बं",
        "बः"
      ],

      "म": [
        "म",
        "मा",
        "मि",
        "मी",
        "मु",
        "मू",
        "मे",
        "मै",
        "मो",
        "मौ",
        "मं",
        "मः"
      ],

      "य": [
        "य",
        "या",
        "यि",
        "यी",
        "यु",
        "यू",
        "ये",
        "यै",
        "यो",
        "यौ",
        "यं",
        "यः"
      ],

      "र": [
        "र",
        "रा",
        "रि",
        "री",
        "रु",
        "रू",
        "रे",
        "रै",
        "रो",
        "रौ",
        "रं",
        "रः"
      ],

      "ल": [
        "ल",
        "ला",
        "लि",
        "ली",
        "लु",
        "लू",
        "ले",
        "लै",
        "लो",
        "लौ",
        "लं",
        "लः"
      ],

      "व": [
        "व",
        "वा",
        "वि",
        "वी",
        "वु",
        "वू",
        "वे",
        "वै",
        "वो",
        "वौ",
        "वं",
        "वः"
      ],

      "श": [
        "श",
        "शा",
        "शि",
        "शी",
        "शु",
        "शू",
        "शे",
        "शै",
        "शो",
        "शौ",
        "शं",
        "शः"
      ],

      "ष": [
        "ष",
        "षा",
        "षि",
        "षी",
        "षु",
        "षू",
        "षे",
        "षै",
        "षो",
        "षौ",
        "षं",
        "षः"
      ],

      "स": [
        "स",
        "सा",
        "सि",
        "सी",
        "सु",
        "सू",
        "से",
        "सै",
        "सो",
        "सौ",
        "सं",
        "सः"
      ],

      "ह": [
        "ह",
        "हा",
        "हि",
        "ही",
        "हु",
        "हू",
        "हे",
        "है",
        "हो",
        "हौ",
        "हं",
        "हः"
      ],

      "ळ": [
        "ळ",
        "ळा",
        "ळि",
        "ळी",
        "ळु",
        "ळू",
        "ळे",
        "ळै",
        "ळो",
        "ळौ",
        "ळं",
        "ळः"
      ],

      "क्ष": [
        "क्ष",
        "क्षा",
        "क्षि",
        "क्षी",
        "क्षु",
        "क्षू",
        "क्षे",
        "क्षै",
        "क्षो",
        "क्षौ",
        "क्षं",
        "क्षः"
      ],

      "ज्ञ": [
        "ज्ञ",
        "ज्ञा",
        "ज्ञि",
        "ज्ञी",
        "ज्ञु",
        "ज्ञू",
        "ज्ञे",
        "ज्ञै",
        "ज्ञो",
        "ज्ञौ",
        "ज्ञं",
        "ज्ञः"
      ],
    };

    return barakhadi[letter] ?? [];
  }

  // ==================================================
  // BUILD
  // ==================================================

  @override
  Widget build(BuildContext context) {
    final List<String> letters =
        getBarakhadi(letter);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$letter Barakhadi",

          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(16),

        itemCount: letters.length,

        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1,
        ),

        itemBuilder: (context, index) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 5,
              shadowColor: Colors.grey,

              shape: const CircleBorder(),

              padding: const EdgeInsets.all(18),
            ),

            // ==========================================
            // OPEN TRACING
            // ==========================================

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TracingScreen(
                    letter: letters[index],

                    // VERY IMPORTANT
                    // Send complete Barakhadi list
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
                // BARAKHADI LETTER
                // ======================================

                Text(
                  letters[index],

                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 5),

                // ======================================
                // SOUND
                // ======================================

                GestureDetector(
                  onTap: () {
                    TtsService.speak(
                      letters[index],
                    );
                  },

                  child: const Icon(
                    Icons.volume_up,
                    color: Colors.green,
                    size: 24,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}