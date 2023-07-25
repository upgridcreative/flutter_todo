import 'package:flutter/material.dart';
import '../theme/colors.dart';

enum CustomProceedButtonType {
  primary, // default
  secondary, 
}

class CustomProceedButton extends StatelessWidget {
  const CustomProceedButton({
    Key? key,
    required this.title,
    this.heightFactor = 1,
    this.customTextStyle,
    this.onPressed,
    this.customButtonType = CustomProceedButtonType.primary,
  }) : super(key: key);

  final String title;
  final double heightFactor;
  final TextStyle? customTextStyle;
  final CustomProceedButtonType customButtonType;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 69 * heightFactor,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorClass.primary,
        ),
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
