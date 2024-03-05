import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final Color textColor;
  const Buttons({
    super.key,
    required this.backgroundColor,
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 15,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
