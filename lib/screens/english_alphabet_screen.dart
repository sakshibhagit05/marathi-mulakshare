import 'package:flutter/material.dart';

import '../services/tts_service.dart';
import 'english_tracing_screen.dart';

class EnglishAlphabetScreen extends StatelessWidget {
  EnglishAlphabetScreen({super.key});

  final List<Map<String, String>> letters = [
    {"letter": "A", "word": "Apple"},
    {"letter": "B", "word": "Ball"},
    {"letter": "C", "word": "Cat"},
    {"letter": "D", "word": "Dog"},
    {"letter": "E", "word": "Elephant"},
    {"letter": "F", "word": "Fish"},
    {"letter": "G", "word": "Grapes"},
    {"letter": "H", "word": "Horse"},
    {"letter": "I", "word": "Ice Cream"},
    {"letter": "J", "word": "Jug"},
    {"letter": "K", "word": "Kite"},
    {"letter": "L", "word": "Lion"},
    {"letter": "M", "word": "Monkey"},
    {"letter": "N", "word": "Nest"},
    {"letter": "O", "word": "Orange"},
    {"letter": "P", "word": "Parrot"},
    {"letter": "Q", "word": "Queen"},
    {"letter": "R", "word": "Rabbit"},
    {"letter": "S", "word": "Sun"},
    {"letter": "T", "word": "Tiger"},
    {"letter": "U", "word": "Umbrella"},
    {"letter": "V", "word": "Van"},
    {"letter": "W", "word": "Watch"},
    {"letter": "X", "word": "Xylophone"},
    {"letter": "Y", "word": "Yak"},
    {"letter": "Z", "word": "Zebra"},
  ];

  @override
  Widget build(BuildContext context) {
    // Complete A-Z list
    final List<String> allLetters =
        letters.map((e) => e["letter"]!).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "English Alphabets",
          style: TextStyle(
            fontSize: 25,
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
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.85,
        ),

        itemBuilder: (context, index) {
          final String currentLetter =
              letters[index]["letter"]!;

          final String word =
              letters[index]["word"]!;

          return InkWell(
            borderRadius: BorderRadius.circular(15),

            onTap: () {
              TtsService.speak(currentLetter);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EnglishTracingScreen(
                    letter: currentLetter,

                    // IMPORTANT
                    // Send complete A-Z list
                    groupLetters: allLetters,
                  ),
                ),
              );
            },

            child: Card(
              elevation: 5,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [
                  // -----------------------------------
                  // LETTER
                  // -----------------------------------

                  Text(
                    currentLetter,
                    style: const TextStyle(
                      fontSize: 65,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // -----------------------------------
                  // WORD
                  // -----------------------------------

                  Text(
                    word,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // -----------------------------------
                  // EDIT ICON
                  // -----------------------------------

                  const Icon(
                    Icons.edit,
                    color: Colors.blue,
                    size: 28,
                  ),

                  const SizedBox(height: 5),

                  // -----------------------------------
                  // SOUND ICON
                  // -----------------------------------

                  IconButton(
                    icon: const Icon(
                      Icons.volume_up,
                      color: Colors.green,
                      size: 30,
                    ),
                    onPressed: () {
                      TtsService.speak(currentLetter);
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