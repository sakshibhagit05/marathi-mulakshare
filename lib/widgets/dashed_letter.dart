import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashedLetter extends StatelessWidget {
  final String svgFile;
  final double? size;

  const DashedLetter({
    super.key,
    required this.svgFile,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        "assets/svg/$svgFile",
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
    );
  }
}