import 'package:flutter/material.dart';

class DrawingBoard extends StatefulWidget {
  DrawingBoard({super.key});

  @override
  State<DrawingBoard> createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<DrawingBoard> {
  final List<Offset?> points = [];
  Color selectedColor = Colors.blue;

  void clear() {
    setState(() {
      points.clear();
    });
  }

  Widget colorButton(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: selectedColor == color
                ? Colors.white
                : Colors.black,
            width: 3,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,

            onPanStart: (details) {
              final RenderBox box =
                  context.findRenderObject() as RenderBox;

              setState(() {
                points.add(
                  box.globalToLocal(details.globalPosition),
                );
              });
            },

            onPanUpdate: (details) {
              final RenderBox box =
                  context.findRenderObject() as RenderBox;

              setState(() {
                points.add(
                  box.globalToLocal(details.globalPosition),
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

        Positioned(
          left: 10,
          right: 10,
          bottom: 10,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
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

                  const SizedBox(width: 10),

                  IconButton(
                    onPressed: clear,
                    icon: const Icon(Icons.refresh),
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

class DrawPainter extends CustomPainter {
  final List<Offset?> points;
  final Color color;

  DrawPainter(this.points, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(
          points[i]!,
          points[i + 1]!,
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant DrawPainter oldDelegate) => true;
}