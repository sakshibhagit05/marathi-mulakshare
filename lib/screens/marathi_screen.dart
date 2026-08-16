import 'package:flutter/material.dart';

import 'mulakshare_screen.dart';
import 'barakhadi_screen.dart';
import 'numbers_screen.dart';
import 'thipke_screen.dart';

class MarathiScreen extends StatelessWidget {
  const MarathiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "मराठी",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(height: 20),

              // =================================================
              // मुळाक्षरे
              // =================================================

              categoryButton(
                context,
                "मुळाक्षरे",
                Colors.orange,
              ),

              const SizedBox(height: 20),

              // =================================================
              // बाराखडी
              // =================================================

              categoryButton(
                context,
                "बाराखडी",
                Colors.green,
              ),

              const SizedBox(height: 20),

              // =================================================
              // अंक
              // =================================================

              categoryButton(
                context,
                "अंक",
                Colors.blue,
              ),

              const SizedBox(height: 20),

              // =================================================
              // ठिपके जोड व गिरव
              // =================================================

              categoryButton(
                context,
                "ठिपके जोड व गिरव",
                Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ===========================================================
  // CATEGORY BUTTON
  // ===========================================================

  Widget categoryButton(
    BuildContext context,
    String title,
    Color color,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(
          double.infinity,
          80,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),

      onPressed: () {

        // -----------------------------------------------
        // मुळाक्षरे
        // -----------------------------------------------

        if (title == "मुळाक्षरे") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MulakshareScreen(),
            ),
          );
        }

        // -----------------------------------------------
        // बाराखडी
        // -----------------------------------------------

        else if (title == "बाराखडी") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const BarakhadiScreen(),
            ),
          );
        }

        // -----------------------------------------------
        // अंक
        // -----------------------------------------------

        else if (title == "अंक") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => NumbersScreen(),
            ),
          );
        }

        // -----------------------------------------------
        // ठिपके जोड व गिरव
        // -----------------------------------------------

        else if (title == "ठिपके जोड व गिरव") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const ThipkeScreen(),
            ),
          );
        }
      },

      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 28,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}