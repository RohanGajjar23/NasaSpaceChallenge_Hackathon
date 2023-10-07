import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: GoogleFonts.comfortaaTextTheme(),
  colorScheme: const ColorScheme.dark(
    background: Color.fromARGB(255, 0, 0, 0),
    onBackground: Colors.white,
    primary: Color.fromARGB(255, 3, 0, 52),
    onPrimary: Colors.white,
    secondary: Color.fromARGB(255, 187, 184, 255),
    onSecondary: Colors.black,
    secondaryContainer: Colors.white,
    onPrimaryContainer: Color.fromARGB(210, 0, 0, 0),
  ),
);
