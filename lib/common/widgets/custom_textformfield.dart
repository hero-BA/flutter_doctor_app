import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final bool obsecureText;
  final Widget suffixIcon;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.obsecureText = false,
    required this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(hintText: hintText, suffixIcon: suffixIcon),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
