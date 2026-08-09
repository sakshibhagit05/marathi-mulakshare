import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MarathiApp());
}

class MarathiApp extends StatelessWidget {
  const MarathiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kids Learning App',
      home: HomeScreen(),
    );
  }
}