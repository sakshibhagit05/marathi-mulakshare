import 'package:flutter/material.dart';
import '../services/tts_service.dart';

class FruitsScreen extends StatelessWidget {
  FruitsScreen({super.key});


  final List<Map<String, dynamic>> fruits = [
    {"english": "Apple", "marathi": "सफरचंद", "emoji": "🍎"},
    {"english": "Banana", "marathi": "केळी", "emoji": "🍌"},
    {"english": "Mango", "marathi": "आंबा", "emoji": "🥭"},
    {"english": "Orange", "marathi": "संत्रे", "emoji": "🍊"},
    {"english": "Grapes", "marathi": "द्राक्षे", "emoji": "🍇"},
    {"english": "Watermelon", "marathi": "टरबूज", "emoji": "🍉"},
    {"english": "Pineapple", "marathi": "अननस", "emoji": "🍍"},
    {"english": "Strawberry", "marathi": "स्ट्रॉबेरी", "emoji": "🍓"},
    {"english": "Cherry", "marathi": "चेरी", "emoji": "🍒"},
    {"english": "Pear", "marathi": "नाशपाती", "emoji": "🍐"},
    {"english": "Peach", "marathi": "पीच", "emoji": "🍑"},
    {"english": "Coconut", "marathi": "नारळ", "emoji": "🥥"},
    {"english": "Kiwi", "marathi": "कीवी", "emoji": "🥝"},
    {"english": "Lemon", "marathi": "लिंबू", "emoji": "🍋"},
    {"english": "Guava", "marathi": "पेरू", "emoji": "🍏"},
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Fruits"),
        centerTitle: true,
      ),


      body: GridView.builder(

        padding: const EdgeInsets.all(16),

        itemCount: fruits.length,


        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(

          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,

        ),


        itemBuilder: (context, index) {


          return InkWell(

            borderRadius: BorderRadius.circular(12),


            onTap: () {

              TtsService.speak(
                fruits[index]["english"],
              );

            },


            child: Card(

              elevation: 5,


              child: Column(

                mainAxisAlignment:
                    MainAxisAlignment.center,


                children: [


                  Text(

                    fruits[index]["emoji"],

                    style: const TextStyle(
                      fontSize: 70,
                    ),

                  ),



                  const SizedBox(height: 10),



                  Text(

                    fruits[index]["english"],

                    textAlign: TextAlign.center,

                    style: const TextStyle(

                      fontSize: 22,
                      fontWeight: FontWeight.bold,

                    ),

                  ),



                  Text(

                    fruits[index]["marathi"],

                    textAlign: TextAlign.center,

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