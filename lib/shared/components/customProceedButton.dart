import 'package:flutter/material.dart';

class CustomProceedButton extends StatelessWidget {
  const CustomProceedButton({
    Key? key,
    required this.title,
    this.heightFactor = 1,
  }) : super(key: key);

  final String title;
  final double heightFactor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 73 * heightFactor,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF1F6FEB),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white.withOpacity(.90),
          fontFamily: 'Main',
          fontSize: 19,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
