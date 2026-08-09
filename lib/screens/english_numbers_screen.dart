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
    return Scaffold(
      appBar: AppBar(
        title: const Text("English Numbers"),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: numbers.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(15),

            onTap: () {
              TtsService.speak(numbers[index]["word"]!);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EnglishTracingScreen(
                    letter: numbers[index]["number"]!,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    numbers[index]["number"]!,
                    style: const TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    numbers[index]["word"]!,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

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