import 'package:flutter/material.dart';

class Vachanpath1Screen extends StatelessWidget {
  const Vachanpath1Screen({super.key});

  final List<String> sentences = const [
    "काका आला.",
    "मामा आला.",
    "लाला आला.",
    "काल आलम आला.",
  ];

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
          "वाचनपाठ–१",
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

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 30,
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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

                child: const Text(
                  "वाचनपाठ–१",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              ...sentences.map(
                (sentence) => Padding(
                  padding: const EdgeInsets.only(
                    bottom: 28,
                  ),

                  child: Text(
                    sentence,
                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}