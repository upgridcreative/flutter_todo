import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CustomShortButton extends StatelessWidget {
  const CustomShortButton({
    Key? key,
    required this.title,
    this.heightFactor = 1,
    this.customTextStyle,
    this.onPressed,
    
  }) : super(key: key);
final String title;
  final double heightFactor;
  final TextStyle? customTextStyle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorClass.primary,
        ),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Text(
          title,
          style: customTextStyle ??
              TextStyle(
                color: Colors.white.withOpacity(1),
                fontFamily: 'Metro',
                fontSize: 21,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}
