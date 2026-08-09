import 'package:flutter/material.dart';
import '../services/tts_service.dart';

class ColorsScreen extends StatelessWidget {
  ColorsScreen({super.key});

  final List<Map<String, dynamic>> colors = [
    {"english": "Red", "marathi": "लाल", "color": Colors.red},
    {"english": "Blue", "marathi": "निळा", "color": Colors.blue},
    {"english": "Green", "marathi": "हिरवा", "color": Colors.green},
    {"english": "Yellow", "marathi": "पिवळा", "color": Colors.yellow},
    {"english": "Orange", "marathi": "नारंगी", "color": Colors.orange},
    {"english": "Pink", "marathi": "गुलाबी", "color": Colors.pink},
    {"english": "Purple", "marathi": "जांभळा", "color": Colors.purple},
    {"english": "Brown", "marathi": "तपकिरी", "color": Colors.brown},
    {"english": "Black", "marathi": "काळा", "color": Colors.black},
    {"english": "White", "marathi": "पांढरा", "color": Colors.white},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Colors"),
        centerTitle: true,
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: colors.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),

        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(12),

            onTap: () {
              TtsService.speak(colors[index]["english"]);
            },

            child: Card(
              elevation: 5,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  CircleAvatar(
                    radius: 35,
                    backgroundColor: colors[index]["color"],
                  ),

                  const SizedBox(height: 12),

                  Text(
                    colors[index]["english"],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    colors[index]["marathi"],
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