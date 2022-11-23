import 'package:flutter/material.dart';
import 'package:flutter_todo/shared/theme/light.dart';

BorderRadius borderRadius = BorderRadius.circular(12);
TextStyle midTitle = const TextStyle(
    fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Montserrat');
TextStyle subTitle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
    color: mainColor);
TextStyle largeTitle = const TextStyle(
    fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black);
InputDecoration textFieldDecoration = InputDecoration(
    enabledBorder: textfieldBorder,
    border: textfieldBorder,
    focusedBorder: textfieldBorder);
InputBorder textfieldBorder = InputBorder.none;
