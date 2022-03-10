import 'package:flutter/material.dart';
import 'package:flutter_todo/theme/dark.dart';
import 'package:flutter_todo/theme/light.dart';
import 'package:flutter_todo/theme/text.dart';

extension TextThemeExtention on ColorScheme {
  CustomTextFields get customTextStyle => CustomTextFields(
        appBarTitle: brightness == Brightness.light
            ? lightThemeAppBarTextStyle
            : darkThemeAppBarTextStyle,
        topBarSubtitle: brightness == Brightness.light
            ? const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Main',
                fontWeight: FontWeight.w700,
              )
            : const TextStyle(),
      );
}
