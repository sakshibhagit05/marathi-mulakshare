import 'dart:math';
import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      "question": "Which fruit is Apple?",
      "answer": "🍎",
      "options": ["🍎", "🍌", "🍇", "🍍"]
    },
    {
      "question": "Which fruit is Banana?",
      "answer": "🍌",
      "options": ["🍎", "🍌", "🍓", "🍉"]
    },
    {
      "question": "Which fruit is Mango?",
      "answer": "🥭",
      "options": ["🥭", "🍍", "🍎", "🍋"]
    },
    {
      "question": "Which animal is Lion?",
      "answer": "🦁",
      "options": ["🐶", "🦁", "🐯", "🐵"]
    },
    {
      "question": "Which animal is Elephant?",
      "answer": "🐘",
      "options": ["🐘", "🦒", "🦁", "🐻"]
    },
    {
      "question": "Which bird is Peacock?",
      "answer": "🦚",
      "options": ["🦚", "🦜", "🦅", "🐧"]
    },
    {
      "question": "Which vehicle is Car?",
      "answer": "🚗",
      "options": ["🚗", "🚌", "🚲", "🚆"]
    },
    {
      "question": "Which shape is Circle?",
      "answer": "⚪",
      "options": ["⚪", "🔺", "🟦", "⭐"]
    },
    {
      "question": "Which color is Red?",
      "answer": "🔴",
      "options": ["🔴", "🟢", "🔵", "🟡"]
    },
    {
      "question": "Which fruit is Watermelon?",
      "answer": "🍉",
      "options": ["🍉", "🍍", "🍒", "🍓"]
    },
  ];

  late List<Map<String, dynamic>> quiz;

  int currentQuestion = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    startQuiz();
  }

  void startQuiz() {
    quiz = List.from(questions);
    quiz.shuffle(Random());

    setState(() {
      currentQuestion = 0;
      score = 0;
    });
  }

  void checkAnswer(String selected) {
    if (selected == quiz[currentQuestion]["answer"]) {
      score++;
    }

    if (currentQuestion < quiz.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            score: score,
            total: quiz.length,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = quiz[currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentQuestion + 1) / quiz.length,
            ),
            const SizedBox(height: 20),

            Text(
              "Question ${currentQuestion + 1}/${quiz.length}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Text(
              q["question"],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            ...List.generate(
              q["options"].length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SizedBox(
                    width: double.infinity,
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () =>
                          checkAnswer(q["options"][index]),
                      child: Text(
                        q["options"][index],
                        style: const TextStyle(fontSize: 35),
                      ),
                    ),
                  ),
                );
              },
            ),

            const Spacer(),

            Text(
              "Score : $score",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;

  const ResultScreen({
    super.key,
    required this.score,
    required this.total,
  });

  String message() {
    if (score == total) {
      return "Excellent!";
    } else if (score >= total * 0.7) {
      return "Very Good!";
    } else if (score >= total * 0.5) {
      return "Good Job!";
    } else {
      return "Keep Practicing!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.emoji_events,
                color: Colors.orange,
                size: 120,
              ),

              const SizedBox(height: 20),

              Text(
                message(),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "Your Score",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey[700],
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "$score / $total",
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 40),

              ElevatedButton.icon(
                icon: const Icon(Icons.refresh),
                label: const Text("Play Again"),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const QuizScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}