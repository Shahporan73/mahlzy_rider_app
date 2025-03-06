import 'package:flutter/material.dart';

class CustomClipPathRadiusWidget extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Move to the bottom left
    path.moveTo(0, 80);

    // Create the curve at the top
    path.quadraticBezierTo(
        size.width / 2,  0, size.width, 80);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}