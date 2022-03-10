import 'package:flutter/material.dart';

class WelcomeScreenClipper extends CustomClipper<Path> {
  WelcomeScreenClipper({required this.height, required this.width});

  final double height;

  final double width;

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / width;
    final double _yScaling = size.height / height;
    path.lineTo(0 * _xScaling, 0 * _yScaling);
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      390 * _xScaling,
      0 * _yScaling,
      390 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      390 * _xScaling,
      0 * _yScaling,
      390 * _xScaling,
      310 * _yScaling,
      390 * _xScaling,
      310 * _yScaling,
    );
    path.cubicTo(
      390 * _xScaling,
      310 * _yScaling,
      314 * _xScaling,
      130.5 * _yScaling,
      235.5 * _xScaling,
      266 * _yScaling,
    );
    path.cubicTo(
      157 * _xScaling,
      401.5 * _yScaling,
      0 * _xScaling,
      310 * _yScaling,
      0 * _xScaling,
      310 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      310 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
