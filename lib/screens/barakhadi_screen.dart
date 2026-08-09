import 'package:flutter/material.dart';
import 'barakhadi_detail_screen.dart';
import '../services/tts_service.dart';

class BarakhadiScreen extends StatelessWidget {
  const BarakhadiScreen({super.key});

  final List<String> letters = const [
    "क",
    "ख",
    "ग",
    "घ",
    "ङ",
    "च",
    "छ",
    "ज",
    "झ",
    "ञ",
    "ट",
    "ठ",
    "ड",
    "ढ",
    "ण",
    "त",
    "थ",
    "द",
    "ध",
    "न",
    "प",
    "फ",
    "ब",
    "भ",
    "म",
    "य",
    "र",
    "ल",
    "व",
    "श",
    "ष",
    "स",
    "ह",
    "ळ",
    "क्ष",
    "ज्ञ",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("मराठी बाराखडी"),
        centerTitle: true,
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(16),

        itemCount: letters.length,

        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
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

            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      BarakhadiDetailScreen(
                        letter: letters[index],
                      ),
                ),
              );

            },


            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,

              children: [

                Text(
                  letters[index],

                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),


                const SizedBox(height: 5),


                GestureDetector(
                  onTap: () {

                    TtsService.speak(
                      letters[index],
                    );

                  },

                  child: const Icon(
                    Icons.volume_up,
                    size: 25,
                    color: Colors.green,
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