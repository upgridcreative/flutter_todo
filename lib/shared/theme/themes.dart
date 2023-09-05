import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  backgroundColor: Colors.black,
  primaryColor: ColorClass.primary,
  scaffoldBackgroundColor: Colors.black,
  cardColor: const Color(0xFF232323),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  colorScheme: const ColorScheme.dark(
    primary: ColorClass.primary,
    secondary: Color(0xFF385595),
    surface: Color(0xFF232323),
    error: Colors.red,
    background: Colors.black,
    onBackground: Colors.black,
  ),
  textTheme: ThemeData.dark().textTheme.copyWith(
        displayMedium: TextStyle(
          color: Colors.white.withOpacity(.9),
          fontSize: 14,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
        ),
        displayLarge: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: Colors.white.withAlpha(210),
          fontSize: 12,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
      ),
);

final lightTheme = ThemeData.light().copyWith(
  useMaterial3: true,
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: ColorClass.primary,
  cardColor: const Color(0xFFEEEEEE),
  colorScheme: const ColorScheme.light(
    primary: ColorClass.primary,
    secondary: Color(0xFF385595),
    surface: Color(0xFFEEEEEE),
    error: Colors.red,
    background: Colors.white,
    onBackground: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  textTheme: ThemeData.light().textTheme.copyWith(
        displayMedium: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
        ),
        displayLarge: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
        ),
        displaySmall: const TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
      ),
);
