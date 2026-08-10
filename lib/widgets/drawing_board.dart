import 'package:flutter/material.dart';

class DrawingBoard extends StatefulWidget {
  DrawingBoard({super.key});

  @override
  State<DrawingBoard> createState() =>
      _DrawingBoardState();
}

class _DrawingBoardState
    extends State<DrawingBoard> {
  final List<Offset?> points = [];

  Color selectedColor = Colors.blue;

  // =====================================================
  // CLEAR DRAWING
  // =====================================================

  void clear() {
    setState(() {
      points.clear();
    });
  }

  // =====================================================
  // COLOR BUTTON
  // =====================================================

  Widget colorButton(Color color) {
    final bool isSelected =
        selectedColor == color;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },

      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 5,
        ),

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

            onPanStart: (details) {
              final RenderBox box =
                  context.findRenderObject()
                      as RenderBox;

              setState(() {
                points.add(
                  box.globalToLocal(
                    details.globalPosition,
                  ),
                );
              });
            },

            onPanUpdate: (details) {
              final RenderBox box =
                  context.findRenderObject()
                      as RenderBox;

              setState(() {
                points.add(
                  box.globalToLocal(
                    details.globalPosition,
                  ),
                );
              });
            },

            onPanEnd: (_) {
              setState(() {
                points.add(null);
              });
            },

            child: CustomPaint(
              painter: DrawPainter(
                points,
                selectedColor,
              ),

              child: Container(),
            ),
          ),
        ),

        // =================================================
        // COLOR BAR
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

              borderRadius:
                  BorderRadius.circular(18),

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

                  IconButton(
                    onPressed: clear,

                    icon: const Icon(
                      Icons.refresh,
                      size: 30,
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
  final List<Offset?> points;
  final Color color;

  DrawPainter(
    this.points,
    this.color,
  );

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 9
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    for (
      int i = 0;
      i < points.length - 1;
      i++
    ) {
      if (
        points[i] != null &&
        points[i + 1] != null
      ) {
        canvas.drawLine(
          points[i]!,
          points[i + 1]!,
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(
    covariant DrawPainter oldDelegate,
  ) {
    return true;
  }
}