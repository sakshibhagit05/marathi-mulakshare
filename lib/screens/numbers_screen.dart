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
        title: const Text("मराठी अंक"),
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
            borderRadius: BorderRadius.circular(12),

            onTap: () {
              TtsService.speak(numbers[index]["word"]!);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TracingScreen(
                    letter: numbers[index]["number"]!,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    numbers[index]["number"]!,
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    numbers[index]["word"]!,
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