import 'package:flutter/material.dart';
import 'mulakshare_screen.dart';
import 'barakhadi_screen.dart';
import 'numbers_screen.dart';

class MarathiScreen extends StatelessWidget {
  const MarathiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("मराठी"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),

            categoryButton(
              context,
              "मुळाक्षरे",
              Colors.orange,
            ),

            const SizedBox(height: 20),

            categoryButton(
              context,
              "बाराखडी",
              Colors.green,
            ),

            const SizedBox(height: 20),

            categoryButton(
              context,
              "अंक",
              Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryButton(
    BuildContext context,
    String title,
    Color color,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 80),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),

      onPressed: () {
        if (title == "मुळाक्षरे") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MulakshareScreen(),
            ),
          );
        } else if (title == "बाराखडी") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const BarakhadiScreen(),
            ),
          );
        } else if (title == "अंक") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => NumbersScreen(),
            ),
          );
        }
      },

      child: Text(
        title,
        style: const TextStyle(
          fontSize: 28,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}