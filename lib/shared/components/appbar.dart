import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 25, right: 15),
      child: Row(
        children: [
          const Icon(Icons.arrow_back_ios),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: Colors.black,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
