import 'package:flutter/material.dart';

import '../services/tts_service.dart';
import 'tracing_screen.dart';

class NumbersScreen extends StatelessWidget {
  NumbersScreen({super.key});

  final List<Map<String, String>> numbers = [
    {"number": "१", "word": "एक"},
    {"number": "२", "word": "दोन"},
    {"number": "३", "word": "तीन"},
    {"number": "४", "word": "चार"},
    {"number": "५", "word": "पाच"},
    {"number": "६", "word": "सहा"},
    {"number": "७", "word": "सात"},
    {"number": "८", "word": "आठ"},
    {"number": "९", "word": "नऊ"},
    {"number": "१०", "word": "दहा"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "मराठी अंक",
          style: TextStyle(
            fontSize: 24,
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
          childAspectRatio: 0.9,
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
                  builder: (_) => TracingScreen(
                    letter: number,

                    // VERY IMPORTANT
                    // Send complete Marathi number list
                    groupLetters: numbers
                        .map((item) => item["number"]!)
                        .toList(),
                  ),
                ),
              );
            },

            child: Card(
              elevation: 5,

              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(15),
              ),

              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [
                  Text(
                    number,

                    style: const TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    word,

                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Icon(
                    Icons.volume_up,
                    color: Colors.green,
                    size: 30,
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