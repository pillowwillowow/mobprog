import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFont extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final TextAlign? align;
  final double? letterSpacing;

  const CustomFont({
    super.key,
    required this.text,
    required this.fontSize,
    this.color = Colors.black,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily = "Frutiger" "Klavika",
    this.align,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize.sp,
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
