import 'package:flutter/material.dart';
import '../services/tts_service.dart';

class VehiclesScreen extends StatelessWidget {
  VehiclesScreen({super.key});

  final List<Map<String, dynamic>> vehicles = [
    {"english": "Car", "marathi": "गाडी", "emoji": "🚗"},
    {"english": "Bus", "marathi": "बस", "emoji": "🚌"},
    {"english": "Train", "marathi": "रेल्वे", "emoji": "🚆"},
    {"english": "Bike", "marathi": "दुचाकी", "emoji": "🏍️"},
    {"english": "Bicycle", "marathi": "सायकल", "emoji": "🚲"},
    {"english": "Aeroplane", "marathi": "विमान", "emoji": "✈️"},
    {"english": "Ship", "marathi": "जहाज", "emoji": "🚢"},
    {"english": "Truck", "marathi": "ट्रक", "emoji": "🚚"},
    {"english": "Auto Rickshaw", "marathi": "रिक्षा", "emoji": "🛺"},
    {"english": "Helicopter", "marathi": "हेलिकॉप्टर", "emoji": "🚁"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vehicles"),
        centerTitle: true,
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: vehicles.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),

        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(12),

            onTap: () {
              TtsService.speak(vehicles[index]["english"]);
            },

            child: Card(
              elevation: 5,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Text(
                    vehicles[index]["emoji"],
                    style: const TextStyle(
                      fontSize: 70,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    vehicles[index]["english"],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    vehicles[index]["marathi"],
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