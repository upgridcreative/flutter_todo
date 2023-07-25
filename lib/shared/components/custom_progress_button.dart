import 'package:flutter/material.dart';
import '../theme/colors.dart';

class CustomProgressButton extends StatelessWidget {
  const CustomProgressButton({
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
    return Container(
      height: 69 * heightFactor,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorClass.primary,
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: customTextStyle ??
                TextStyle(
                  color: Colors.white.withOpacity(.8),
                  fontFamily: 'Metro',
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            height: 20 * heightFactor,
            width: 20 * heightFactor,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.white.withOpacity(.8),
            ),
          ),
        ],
      ),
    );
  }
}
