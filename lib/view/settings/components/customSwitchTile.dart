import 'package:flutter/material.dart';
import 'package:flutter_todo/shared/theme/colors.dart';

class CustomSwitchTile extends StatefulWidget {
  final String title;
  final bool value;
  final Function() onTap;

  const CustomSwitchTile({
    Key? key,
    required this.title,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomSwitchTile> createState() => _CustomSwitchTileState();
}

class _CustomSwitchTileState extends State<CustomSwitchTile> {
  bool switchVal = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 17,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Switch(
            value: widget.value,
            activeColor: ColorClass.primary,
            onChanged: (b) {
              widget.onTap();
            },
          ),
        ],
      ),
    );
  }
}
