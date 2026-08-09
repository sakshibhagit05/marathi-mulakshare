import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashedLetter extends StatelessWidget {

  final String svgFile;

  const DashedLetter({
    super.key,
    required this.svgFile,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        "assets/svg/$svgFile",
        width: 280,
        height: 280,
      ),
    );
  }
}