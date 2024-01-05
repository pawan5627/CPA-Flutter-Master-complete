import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double value;
  final Color backgroundColor;
  final Color fillColor;
  final double height;
  final double borderRadius;
  final double padding;

  ProgressBar({
    required this.value,
    required this.backgroundColor, // Pass the background color directly
    this.fillColor = Colors.blue, // You can also customize the filled color
    this.height = 5.0,
    this.borderRadius = 5.0,
    this.padding = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor, // Use the passed background color
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.topLeft, // Set alignment to start from the left
        widthFactor: value,
        child: Container(
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
