import 'package:flutter/material.dart';

class MoveTickClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    const int tickCount = 8; // Number of ticks
    
    // Start from top-left
    path.lineTo(0.0, size.height);

    // Create tick marks (similar to sharp waves)
    double stepWidth = size.width / (tickCount * 2);
    for (int i = 0; i < tickCount * 2; i++) {
      if (i.isEven) {
        path.lineTo(stepWidth * i, size.height - 30); // Move tick upward
      } else {
        path.lineTo(stepWidth * i, size.height); // Move tick downward
      }
    }

    // Close the path along the right side and top
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}