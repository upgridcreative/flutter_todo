import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    this.obscure = false,
  }) : super(key: key);

  final String hint;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: const TextStyle(
            color: Color(0xFF000000),
            fontWeight: FontWeight.w700,
            fontFamily: 'Main',
            fontSize: 15,
          ),
          obscureText: obscure,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            fillColor: const Color(0xFFc2c2c2).withOpacity(.4),
            filled: true,
            contentPadding: const EdgeInsets.all(22),
            hintText: hint,
            hintStyle: const TextStyle(
              color: Color(0xFF000000),
              fontFamily: 'Main',
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
