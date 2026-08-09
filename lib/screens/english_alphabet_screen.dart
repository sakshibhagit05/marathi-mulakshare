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
    return Scaffold(
      appBar: AppBar(
        title: const Text("English Alphabets"),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: letters.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(12),

            onTap: () {
              TtsService.speak(letters[index]["letter"]!);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EnglishTracingScreen(
                    letter: letters[index]["letter"]!,
                  ),
                ),
              );
            },

            child: Card(
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    letters[index]["letter"]!,
                    style: const TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    letters[index]["word"]!,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),

                  const SizedBox(height: 5),

                  const Icon(
                    Icons.volume_up,
                    color: Colors.green,
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