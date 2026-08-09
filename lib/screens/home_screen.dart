import 'package:flutter/material.dart';

import 'marathi_screen.dart';
import 'english_screen.dart';
import 'colors_screen.dart';
import 'shapes_screen.dart';
import 'animals_screen.dart';
import 'fruits_screen.dart';
import 'vehicles_screen.dart';
import 'birds_screen.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> categories = [
    {
      "title": "मराठी",
      "icon": Icons.menu_book,
      "color": Colors.orange,
    },
    {
      "title": "English",
      "icon": Icons.abc,
      "color": Colors.blue,
    },
    {
      "title": "Colors",
      "icon": Icons.palette,
      "color": Colors.red,
    },
    {
      "title": "Shapes",
      "icon": Icons.category,
      "color": Colors.purple,
    },
    {
      "title": "Animals",
      "icon": Icons.pets,
      "color": Colors.green,
    },
    {
      "title": "Fruits",
      "icon": Icons.apple,
      "color": Colors.deepOrange,
    },
    {
      "title": "Vehicles",
      "icon": Icons.directions_car,
      "color": Colors.teal,
    },
    {
      "title": "Birds",
      "icon": Icons.flutter_dash,
      "color": Colors.indigo,
    },
    {
      "title": "Quiz",
      "icon": Icons.quiz,
      "color": Colors.amber,
    },
  ];

  void _navigate(BuildContext context, String title) {
    if (title == "मराठी") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const MarathiScreen()),
      );
    } else if (title == "English") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => EnglishScreen()),
      );
    } else if (title == "Colors") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ColorsScreen()),
      );
    } else if (title == "Shapes") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ShapesScreen()),
      );
    } else if (title == "Animals") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => AnimalsScreen()),
      );
    } else if (title == "Fruits") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => FruitsScreen()),
      );
    } else if (title == "Vehicles") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => VehiclesScreen()),
      );
    } else if (title == "Birds") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => BirdsScreen()),
      );
    } else if (title == "Quiz") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const QuizScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kids Learning App"),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(7),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.95,
        ),
        itemBuilder: (context, index) {
          final item = categories[index];

          return InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => _navigate(context, item["title"]),
            child: Card(
              elevation: 8,
              color: item["color"],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item["icon"],
                    size: 30,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    item["title"],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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