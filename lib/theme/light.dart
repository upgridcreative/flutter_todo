import 'package:flutter/material.dart';

final lightTextTheme = ThemeData(
  colorScheme: const ColorScheme.light().copyWith(
    background: Colors.white,
    primary: const Color(0xFF43506C),
    secondary: const Color(0xFF000000),

  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(),
);

const lightThemeAppBarTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
);
