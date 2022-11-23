import 'package:flutter/material.dart';

BorderRadius borderRadius = BorderRadius.circular(12);
TextStyle midTitle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
TextStyle subTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black.withOpacity(0.6));
TextStyle largeTitle =
    TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black);
InputDecoration textFieldDecoration = InputDecoration(
  enabledBorder: textfieldBorder,
  border: textfieldBorder,
  focusedBorder: textfieldBorder
);
InputBorder textfieldBorder = InputBorder.none;
