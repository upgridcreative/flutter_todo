import 'package:flutter/material.dart';

class CustomProceedButton extends StatelessWidget {
  const CustomProceedButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF9CB898),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontFamily: 'Main',
          color: Colors.white.withOpacity(.9),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
