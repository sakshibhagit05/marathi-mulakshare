import 'package:flutter/material.dart';
import '../services/tts_service.dart';

class ShapesScreen extends StatelessWidget {
  ShapesScreen({super.key});

  final List<Map<String, dynamic>> shapes = [
    {"english": "Circle", "marathi": "वर्तुळ", "emoji": "⚪"},
    {"english": "Square", "marathi": "चौरस", "emoji": "⬜"},
    {"english": "Triangle", "marathi": "त्रिकोण", "emoji": "🔺"},
    {"english": "Rectangle", "marathi": "आयत", "emoji": "▭"},
    {"english": "Star", "marathi": "तारा", "emoji": "⭐"},
    {"english": "Heart", "marathi": "हृदय", "emoji": "❤️"},
    {"english": "Oval", "marathi": "अंडाकृती", "emoji": "🥚"},
    {"english": "Diamond", "marathi": "हिरे", "emoji": "♦️"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shapes"),
        centerTitle: true,
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: shapes.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),

        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(12),

            onTap: () {
              TtsService.speak(shapes[index]["english"]);
            },

            child: Card(
              elevation: 5,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Text(
                    shapes[index]["emoji"],
                    style: const TextStyle(
                      fontSize: 65,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    shapes[index]["english"],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    shapes[index]["marathi"],
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

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