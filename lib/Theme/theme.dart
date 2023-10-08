import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme: GoogleFonts.rajdhaniTextTheme(),
  colorScheme: const ColorScheme.dark(
    background: Color.fromARGB(255, 0, 0, 0),
    onBackground: Colors.white,
    primary: Color.fromARGB(255, 3, 0, 52),
    onPrimary: Colors.white,
    secondary: Color.fromARGB(255, 69, 68, 74),
    onSecondary: Colors.black,
    secondaryContainer: Colors.white,
    onPrimaryContainer: Color.fromARGB(210, 0, 0, 0),
  ),
);
