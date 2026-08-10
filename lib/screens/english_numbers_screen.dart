import 'package:flutter/material.dart';

import '../services/tts_service.dart';
import 'english_tracing_screen.dart';

class EnglishNumbersScreen extends StatelessWidget {
  EnglishNumbersScreen({super.key});

  final List<Map<String, String>> numbers = [
    {"number": "1", "word": "One"},
    {"number": "2", "word": "Two"},
    {"number": "3", "word": "Three"},
    {"number": "4", "word": "Four"},
    {"number": "5", "word": "Five"},
    {"number": "6", "word": "Six"},
    {"number": "7", "word": "Seven"},
    {"number": "8", "word": "Eight"},
    {"number": "9", "word": "Nine"},
    {"number": "10", "word": "Ten"},
  ];

  @override
  Widget build(BuildContext context) {
    // Complete 1-10 list
    final List<String> allNumbers =
        numbers.map((e) => e["number"]!).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "English Numbers",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(16),

        itemCount: numbers.length,

        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.85,
        ),

        itemBuilder: (context, index) {
          final String number =
              numbers[index]["number"]!;

          final String word =
              numbers[index]["word"]!;

          return InkWell(
            borderRadius: BorderRadius.circular(15),

            onTap: () {
              TtsService.speak(word);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EnglishTracingScreen(
                    letter: number,

                    // IMPORTANT
                    // Send complete 1-10 list
                    groupLetters: allNumbers,
                  ),
                ),
              );
            },

            child: Card(
              elevation: 6,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [
                  // -----------------------------------
                  // NUMBER
                  // -----------------------------------

                  Text(
                    number,
                    style: const TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // -----------------------------------
                  // WORD
                  // -----------------------------------

                  Text(
                    word,
                    style: const TextStyle(
                      fontSize: 23,
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
                  // SOUND
                  // -----------------------------------

                  IconButton(
                    icon: const Icon(
                      Icons.volume_up,
                      color: Colors.green,
                      size: 30,
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