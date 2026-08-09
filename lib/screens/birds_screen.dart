import 'package:flutter/material.dart';
import '../services/tts_service.dart';

class BirdsScreen extends StatelessWidget {
  BirdsScreen({super.key});

  final List<Map<String, dynamic>> birds = [
    {"english": "Parrot", "marathi": "पोपट", "emoji": "🦜"},
    {"english": "Peacock", "marathi": "मोर", "emoji": "🦚"},
    {"english": "Crow", "marathi": "कावळा", "emoji": "🐦"},
    {"english": "Sparrow", "marathi": "चिमणी", "emoji": "🐤"},
    {"english": "Pigeon", "marathi": "कबूतर", "emoji": "🕊️"},
    {"english": "Eagle", "marathi": "गरुड", "emoji": "🦅"},
    {"english": "Owl", "marathi": "घुबड", "emoji": "🦉"},
    {"english": "Hen", "marathi": "कोंबडी", "emoji": "🐔"},
    {"english": "Duck", "marathi": "बदक", "emoji": "🦆"},
    {"english": "Swan", "marathi": "राजहंस", "emoji": "🦢"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Birds"),
        centerTitle: true,
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: birds.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),

        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(12),

            onTap: () {
              TtsService.speak(birds[index]["english"]);
            },

            child: Card(
              elevation: 5,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Text(
                    birds[index]["emoji"],
                    style: const TextStyle(
                      fontSize: 70,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    birds[index]["english"],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    birds[index]["marathi"],
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