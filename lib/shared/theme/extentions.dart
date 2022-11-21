import 'package:flutter/material.dart';
import 'package:flutter_todo/shared/theme/dark.dart';
import 'package:flutter_todo/shared/theme/light.dart';
import 'package:flutter_todo/shared/theme/text.dart';

extension TextThemeExtention on ColorScheme {
  CustomTextFields get customTextStyle => CustomTextFields(
        appBarTitle: brightness == Brightness.light
            ? lightThemeAppBarTextStyle
            : darkThemeAppBarTextStyle,
        topBarSubtitle: brightness == Brightness.light
            ? const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Metro',
                fontWeight: FontWeight.w700,
              )
            : const TextStyle(),
      );
}
