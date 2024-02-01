import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 32, 135, 209),
    elevation: 4,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),

  colorScheme: const ColorScheme.light(
    primary: Color(0xFF1677BD),
    secondary: Color(0xFF9DC7E5),
    background: Color(0xFFDBEFFF),
  ),
  inputDecorationTheme:  const InputDecorationTheme(
    fillColor: Color(0xDBEFFFFF),
    filled: true,
  ),
);