import 'package:flutter/material.dart';
import '../services/tts_service.dart';


class AnimalsScreen extends StatelessWidget {

  AnimalsScreen({super.key});


  final List<Map<String, dynamic>> animals = [

    {"english": "Lion", "marathi": "सिंह", "emoji": "🦁"},
    {"english": "Tiger", "marathi": "वाघ", "emoji": "🐯"},
    {"english": "Elephant", "marathi": "हत्ती", "emoji": "🐘"},
    {"english": "Monkey", "marathi": "माकड", "emoji": "🐵"},
    {"english": "Dog", "marathi": "कुत्रा", "emoji": "🐶"},
    {"english": "Cat", "marathi": "मांजर", "emoji": "🐱"},
    {"english": "Cow", "marathi": "गाय", "emoji": "🐄"},
    {"english": "Horse", "marathi": "घोडा", "emoji": "🐴"},
    {"english": "Rabbit", "marathi": "ससा", "emoji": "🐰"},
    {"english": "Bear", "marathi": "अस्वल", "emoji": "🐻"},
    {"english": "Fox", "marathi": "कोल्हा", "emoji": "🦊"},
    {"english": "Goat", "marathi": "शेळी", "emoji": "🐐"},
    {"english": "Sheep", "marathi": "मेंढी", "emoji": "🐑"},
    {"english": "Camel", "marathi": "उंट", "emoji": "🐪"},
    {"english": "Deer", "marathi": "हरिण", "emoji": "🦌"},

  ];


  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        title: const Text("Animals"),

        centerTitle: true,

      ),



      body: GridView.builder(

        padding: const EdgeInsets.all(16),

        itemCount: animals.length,


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
                animals[index]["english"],
              );

            },



            child: Card(

              elevation: 5,


              child: Column(

                mainAxisAlignment:
                    MainAxisAlignment.center,


                children: [


                  Text(

                    animals[index]["emoji"],

                    style: const TextStyle(

                      fontSize: 70,

                    ),

                  ),



                  const SizedBox(height: 10),



                  Text(

                    animals[index]["english"],

                    style: const TextStyle(

                      fontSize: 22,

                      fontWeight: FontWeight.bold,

                    ),

                  ),



                  Text(

                    animals[index]["marathi"],

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