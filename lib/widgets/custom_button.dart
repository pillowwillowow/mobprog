// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kulitaptap/widgets/constants.dart';
import '../widgets/custom_font.dart';

class CustomButton extends StatefulWidget {
  String buttonType;
  String buttonName;
  Color fontColor;
  Color outlineColor;
  Color backgroundColor;
  VoidCallback onPressed;

  CustomButton({
    super.key,
    this.buttonType = 'elevated',
    required this.buttonName,
    this.fontColor = Colors.black,
    required this.onPressed,
    this.outlineColor = Colors.black,
    this.backgroundColor = YF_PRIMARY, required FontWeight fontWeight,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final type = widget.buttonType.toLowerCase();

    if (type == 'outlined') {
      return OutlinedButton(
        onPressed: widget.onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 10.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(color: widget.outlineColor),
        ),
        child: CustomFont(
          text: widget.buttonName,
          fontSize: 12.sp,
          color: widget.fontColor,
        ),
      );
    } else if (type == 'text') {
      return TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 10.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: CustomFont(
          text: widget.buttonName,
          fontSize: 12.sp,
          color: widget.fontColor,
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor,
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 10.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: CustomFont(
          text: widget.buttonName,
          fontSize: 12.sp,
          color: widget.fontColor,
        ),
      );
    }
  }
}
