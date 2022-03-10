
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    required this.title,
    this.obscure = false,
  }) : super(key: key);

  final String hint;

  final String title;

  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(left:10.0),
        //   child: Text(
        //     title,
        //     style: const TextStyle(
        //       color: Color(0xFF121212),
        //       fontWeight: FontWeight.w600,
        //       fontFamily: 'Main',
        //       fontSize: 16,
        //     ),
        //   ),
        // ),
        TextFormField(
          style: const TextStyle(
            color: Color(0xFF121212),
            fontWeight: FontWeight.w600,
            fontFamily: 'Main',
            fontSize: 19,
          ),
          obscureText: obscure,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            fillColor: const Color(0xFFDCDCDC),
            filled: true,
            contentPadding: const EdgeInsets.all(28),
            hintText: hint,
            hintStyle: TextStyle(
              color: const Color(0xFF121212).withOpacity(.6),
              fontFamily: 'Main',
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}
