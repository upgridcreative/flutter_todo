import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

setStatusBarColor(Color color) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: color,
  ));
}
