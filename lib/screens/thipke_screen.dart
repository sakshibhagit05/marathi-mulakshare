import 'package:flutter/material.dart';

class ThipkeScreen extends StatefulWidget {
  const ThipkeScreen({super.key});

  @override
  State<ThipkeScreen> createState() => _ThipkeScreenState();
}

class _ThipkeScreenState extends State<ThipkeScreen> {
  int currentActivity = 0;

  final List<String> activities = List.generate(
    10,
    (index) => 'assets/images/thipke_${index + 1}.png',
  );

  final List<List<Offset>> strokes = [];

  @override
  void initState() {
    super.initState();
    strokes.add([]);
  }

  void nextActivity() {
    if (currentActivity < activities.length - 1) {
      setState(() {
        currentActivity++;
        strokes.clear();
        strokes.add([]);
      });
    }
  }

  void previousActivity() {
    if (currentActivity > 0) {
      setState(() {
        currentActivity--;
        strokes.clear();
        strokes.add([]);
      });
    }
  }

  void startDrawing(Offset point) {
    setState(() {
      if (strokes.isEmpty) {
        strokes.add([]);
      }

      strokes.last.add(point);
    });
  }

  void updateDrawing(Offset point) {
    setState(() {
      if (strokes.isNotEmpty) {
        strokes.last.add(point);
      }
    });
  }

  void endDrawing() {
    setState(() {
      strokes.add([]);
    });
  }

  void undo() {
    setState(() {
      if (strokes.isNotEmpty) {
        strokes.removeLast();

        if (strokes.isEmpty) {
          strokes.add([]);
        }
      }
    });
  }

  void clearDrawing() {
    setState(() {
      strokes.clear();
      strokes.add([]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FF),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF0FA),
        elevation: 0,

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
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        centerTitle: true,
      ),

      body: Column(
        children: [

          // =====================================================
          // TOP TITLE + CONTROLS
          // =====================================================

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 10,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xFFE8D8FF),
                    borderRadius: BorderRadius.circular(16),

                    border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    ),
                  ),

                  child: Text(
                    "ठिपके जोड व गिरव",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                IconButton(
                  tooltip: "Undo",
                  icon: const Icon(
                    Icons.undo,
                    size: 28,
                  ),
                  onPressed: undo,
                ),

                IconButton(
                  tooltip: "Clear",
                  icon: const Icon(
                    Icons.delete_outline,
                    size: 28,
                  ),
                  onPressed: clearDrawing,
                ),
              ],
            ),
          ),

          // =====================================================
          // ACTIVITY NUMBER
          // =====================================================

          Text(
            "उपक्रम ${currentActivity + 1} / ${activities.length}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),

          const SizedBox(height: 8),

          // =====================================================
          // IMAGE + DRAWING AREA
          // =====================================================

          Expanded(
            child: Center(
              child: LayoutBuilder(
                builder: (context, constraints) {

                  final imageWidth = constraints.maxWidth > 900
                      ? 700.0
                      : constraints.maxWidth * 0.94;

                  return SizedBox(
                    width: imageWidth,

                    child: AspectRatio(
                      aspectRatio: 0.72,

                      child: Stack(
                        children: [

                          // -------------------------------------
                          // ORIGINAL WORKSHEET IMAGE
                          // -------------------------------------

                          Positioned.fill(
                            child: Image.asset(
                              activities[currentActivity],

                              fit: BoxFit.contain,

                              errorBuilder:
                                  (context, error, stackTrace) {
                                return Center(
                                  child: Text(
                                    "Image सापडली नाही\n\n"
                                    "${activities[currentActivity]}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.red,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          // -------------------------------------
                          // DRAWING LAYER
                          // -------------------------------------

                          Positioned.fill(
                            child: GestureDetector(

                              behavior:
                                  HitTestBehavior.translucent,

                              onPanStart: (details) {
                                startDrawing(
                                  details.localPosition,
                                );
                              },

                              onPanUpdate: (details) {
                                updateDrawing(
                                  details.localPosition,
                                );
                              },

                              onPanEnd: (details) {
                                endDrawing();
                              },

                              child: CustomPaint(
                                painter: TracePainter(
                                  strokes: strokes,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // =====================================================
          // PREVIOUS / NEXT BUTTONS
          // =====================================================

          Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              8,
              20,
              16,
            ),

            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [

                // PREVIOUS
                ElevatedButton.icon(
                  onPressed: currentActivity > 0
                      ? previousActivity
                      : null,

                  icon: const Icon(
                    Icons.arrow_back,
                  ),

                  label: const Text(
                    "मागील",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 12,
                    ),
                  ),
                ),

                // NEXT
                ElevatedButton.icon(
                  onPressed:
                      currentActivity <
                              activities.length - 1
                          ? nextActivity
                          : null,

                  icon: const Icon(
                    Icons.arrow_forward,
                  ),

                  label: const Text(
                    "पुढील",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================
// TRACE PAINTER
// =============================================================

class TracePainter extends CustomPainter {
  final List<List<Offset>> strokes;

  TracePainter({
    required this.strokes,
  });

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    for (final stroke in strokes) {
      if (stroke.length < 2) {
        continue;
      }

      final path = Path();

      path.moveTo(
        stroke.first.dx,
        stroke.first.dy,
      );

      for (int i = 1; i < stroke.length; i++) {
        path.lineTo(
          stroke[i].dx,
          stroke[i].dy,
        );
      }

      canvas.drawPath(
        path,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(
    covariant TracePainter oldDelegate,
  ) {
    return true;
  }
}