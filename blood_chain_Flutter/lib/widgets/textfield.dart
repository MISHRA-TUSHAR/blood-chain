import 'package:blood/utils/colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidgets extends StatelessWidget {
  final TextEditingController textController;
  final String? hintText;
  final double? borderRadius;
  final int? maxLines;
  final bool? obscureText;

  const TextFieldWidgets(
      {super.key,
      required this.textController,
      required this.hintText,
      this.borderRadius = 30,
      this.maxLines = 1,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      controller: textController,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textHolder,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: const BorderSide(
            color: AppColors.textHolder,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: const BorderSide(
            color: AppColors.textHolder,
            width: 1,
          ),
        ),
      ),
    );
  }
}
