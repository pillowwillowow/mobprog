import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onSaved;
  final TextEditingController controller;
  final bool isObscure;
  final double fontSize;
  final Color fontColor;
  final double height;
  final double width;
  final double hintTextSize;
  final String hintText;
  final Color fillColor;
  final TextInputType keyboardType;
  final int maxLength;
  final bool isPassword;
  final VoidCallback? toggleObscure;


  const CustomTextFormField({
    super.key,
    required this.validator,
    required this.onSaved,
    required this.controller,
    this.isObscure = false,
    this.isPassword = false,
    this.toggleObscure,
    required this.fontSize,
    required this.fontColor,
    required this.height,
    required this.width,
    this.hintTextSize = 12,
    this.hintText = '',
    this.fillColor = Colors.black12,
    this.keyboardType = TextInputType.text,
    this.maxLength = 200,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved: onSaved,
      controller: controller,
      obscureText: isObscure,
      keyboardType: keyboardType,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
      ],
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(width, height, width, height),

        // Password visibility toggle
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                  color: YF_PRIMARY,
                ),
                onPressed: toggleObscure,
              )
            : null,

        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: YF_PRIMARY, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: YF_LIGHT, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: hintTextSize,
          color: Colors.black45,
        ),
      ),
    );
  }
}
