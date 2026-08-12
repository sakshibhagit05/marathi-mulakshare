import 'package:flutter/material.dart';

class VachanpathScreen extends StatelessWidget {
  final int pathNumber;
  final List<String> sentences;

  const VachanpathScreen({
    super.key,
    required this.pathNumber,
    required this.sentences,
  });

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

        title: Text(
          "वाचनपाठ–$pathNumber",
          style: const TextStyle(
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
          horizontal: 30,
          vertical: 35,
        ),

        child: Column(
          children: [
            // ==========================================
            // TITLE
            // ==========================================

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 12,
              ),

              decoration: BoxDecoration(
                color: const Color(0xFFFFE4F1),
                borderRadius: BorderRadius.circular(20),

                border: Border.all(
                  color: Colors.pink,
                  width: 2,
                ),
              ),

              child: Text(
                "वाचनपाठ–$pathNumber",
                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // ==========================================
            // READING SENTENCES
            // ==========================================

            ...sentences.map(
              (sentence) => Padding(
                padding: const EdgeInsets.only(
                  bottom: 25,
                ),

                child: Align(
                  alignment: Alignment.centerLeft,

                  child: Text(
                    sentence,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}