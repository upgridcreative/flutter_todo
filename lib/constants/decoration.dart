import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

BorderRadius borderRadius = BorderRadius.circular(12);
TextStyle midTitle = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);
TextStyle subTitle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: Theme.of(Get.context!).primaryColor,
);

TextStyle noteTitle = const TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);

InputDecoration textFieldDecoration = InputDecoration(
  enabledBorder: textfieldBorder,
  border: textfieldBorder,
  focusedBorder: textfieldBorder,
);
InputBorder textfieldBorder = InputBorder.none;
