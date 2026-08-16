import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThipkeJodGiravScreen extends StatelessWidget {
  const ThipkeJodGiravScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FF),

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          "ठिपके जोड व गिरव",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        centerTitle: true,
        backgroundColor: const Color(0xFFFFF0FA),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 25,
        ),

        child: Column(
          children: [

            // =================================================
            // TITLE
            // =================================================

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 12,
              ),

              decoration: BoxDecoration(
                color: const Color(0xFFE8D7FF),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.purple,
                  width: 2,
                ),
              ),

              child: const Text(
                "ठिपके जोड व गिरव",
                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // =================================================
            // FIRST SVG
            // =================================================

            Container(
              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),

              child: SvgPicture.asset(
                'assets/images/thipke_1.svg',
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 25),

            // =================================================
            // SECOND SVG
            // =================================================

            Container(
              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),

              child: SvgPicture.asset(
                'assets/images/thipke_2.svg',
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}