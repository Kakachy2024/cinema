import 'package:flutter/material.dart';

//contruyendo nuestro theme
class AppTheme {
  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: const Color.fromARGB(199, 94, 72, 205));
}
