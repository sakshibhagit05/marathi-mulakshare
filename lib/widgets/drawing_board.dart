import 'package:flutter/material.dart';

class DrawingBoard extends StatefulWidget {
  const DrawingBoard({super.key});

  @override
  State<DrawingBoard> createState() => _DrawingBoardState();
}

// =====================================================
// DRAWING STROKE
// =====================================================

class DrawingStroke {
  final List<Offset?> points;
  final Color color;

  DrawingStroke({
    required this.points,
    required this.color,
  });
}

// =====================================================
// DRAWING BOARD STATE
// =====================================================

class _DrawingBoardState extends State<DrawingBoard> {
  final List<DrawingStroke> strokes = [];

  Color selectedColor = Colors.blue;

  List<Offset?>? currentPoints;

  // =====================================================
  // UNDO - REMOVE LAST STROKE
  // =====================================================

  void undo() {
    if (strokes.isEmpty) {
      return;
    }

    setState(() {
      strokes.removeLast();
    });
  }

  // =====================================================
  // CLEAR - REMOVE EVERYTHING
  // =====================================================

  void clear() {
    if (strokes.isEmpty) {
      return;
    }

    setState(() {
      strokes.clear();
      currentPoints = null;
    });
  }

  // =====================================================
  // COLOR BUTTON
  // =====================================================

  Widget colorButton(Color color) {
    final bool isSelected = selectedColor == color;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? Colors.white
                : Colors.black,
            width: 3,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
            ),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // GET LOCAL POSITION
  // =====================================================

  Offset getLocalPosition(
    BuildContext context,
    Offset globalPosition,
  ) {
    final RenderBox box =
        context.findRenderObject() as RenderBox;

    return box.globalToLocal(globalPosition);
  }

  // =====================================================
  // BUILD
  // =====================================================

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // =================================================
        // DRAWING AREA
        // =================================================

        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,

            // ---------------------------------------------
            // START STROKE
            // ---------------------------------------------

            onPanStart: (details) {
              final Offset position =
                  getLocalPosition(
                context,
                details.globalPosition,
              );

              setState(() {
                currentPoints = [position];
              });
            },

            // ---------------------------------------------
            // DRAW STROKE
            // ---------------------------------------------

            onPanUpdate: (details) {
              final Offset position =
                  getLocalPosition(
                context,
                details.globalPosition,
              );

              setState(() {
                currentPoints ??= [];
                currentPoints!.add(position);
              });
            },

            // ---------------------------------------------
            // FINISH STROKE
            // ---------------------------------------------

            onPanEnd: (_) {
              if (currentPoints == null ||
                  currentPoints!.isEmpty) {
                return;
              }

              setState(() {
                strokes.add(
                  DrawingStroke(
                    points: List<Offset?>.from(
                      currentPoints!,
                    ),
                    color: selectedColor,
                  ),
                );

                currentPoints = null;
              });
            },

            // ---------------------------------------------
            // PAINTER
            // ---------------------------------------------

            child: CustomPaint(
              painter: DrawPainter(
                strokes: strokes,
                currentPoints: currentPoints,
                currentColor: selectedColor,
              ),
              child: Container(),
            ),
          ),
        ),

        // =================================================
        // BOTTOM CONTROL BAR
        // =================================================

        Positioned(
          left: 10,
          right: 10,
          bottom: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // =================================================
                  // COLORS
                  // =================================================

                  colorButton(Colors.red),
                  colorButton(Colors.orange),
                  colorButton(Colors.yellow),
                  colorButton(Colors.green),
                  colorButton(Colors.blue),
                  colorButton(Colors.purple),
                  colorButton(Colors.brown),
                  colorButton(Colors.black),

                  const SizedBox(width: 8),

                  Container(
                    width: 1,
                    height: 35,
                    color: Colors.grey.shade300,
                  ),

                  const SizedBox(width: 8),

                  // =================================================
                  // UNDO BUTTON
                  // =================================================

                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: strokes.isEmpty
                          ? null
                          : undo,
                      borderRadius:
                          BorderRadius.circular(30),
                      child: Padding(
                        padding:
                            const EdgeInsets.all(6),
                        child: Icon(
                          Icons.undo,
                          size: 32,
                          color: strokes.isEmpty
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  // =================================================
                  // CLEAR BUTTON
                  // =================================================

                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: strokes.isEmpty
                          ? null
                          : clear,
                      borderRadius:
                          BorderRadius.circular(30),
                      child: Padding(
                        padding:
                            const EdgeInsets.all(6),
                        child: Icon(
                          Icons.refresh,
                          size: 32,
                          color: strokes.isEmpty
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// =====================================================
// DRAW PAINTER
// =====================================================

class DrawPainter extends CustomPainter {
  final List<DrawingStroke> strokes;
  final List<Offset?>? currentPoints;
  final Color currentColor;

  DrawPainter({
    required this.strokes,
    required this.currentPoints,
    required this.currentColor,
  });

  // =====================================================
  // DRAW ONE STROKE
  // =====================================================

  void drawStroke(
    Canvas canvas,
    List<Offset?> points,
    Color color,
  ) {
    if (points.length < 2) {
      return;
    }

    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 9
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null &&
          points[i + 1] != null) {
        canvas.drawLine(
          points[i]!,
          points[i + 1]!,
          paint,
        );
      }
    }
  }

  // =====================================================
  // PAINT
  // =====================================================

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    // Draw all completed strokes
    for (final stroke in strokes) {
      drawStroke(
        canvas,
        stroke.points,
        stroke.color,
      );
    }

    // Draw current stroke while finger is moving
    if (currentPoints != null) {
      drawStroke(
        canvas,
        currentPoints!,
        currentColor,
      );
    }
  }

  // =====================================================
  // REPAINT
  // =====================================================

  @override
  bool shouldRepaint(
    covariant DrawPainter oldDelegate,
  ) {
    return true;
  }
}