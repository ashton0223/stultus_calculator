import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  CalculatorButton({
    this.color,
    this.textColor,
    this.text,
    this.tapped,
  });

  final color;
  final textColor;
  final text;
  final tapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: tapped,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Center(child: Text(text)),
        ),
      ),
    );
  }
}
