import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Image
const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

// Color
const Color blackColor = Color(0xFF000000);
const Color darkRedColor = Color(0xFF3D0000);
const Color bloodRedColor = Color(0xFF950101);
const Color lightRedColor = Color(0xFFFF0000);
const Color whiteColor = Color(0xFFFFFFFF);

// Text Style
final TextStyle superTitleText = GoogleFonts.fredoka(
    fontSize: 24, fontWeight: FontWeight.bold, color: lightRedColor);
final TextStyle titleText = GoogleFonts.fredoka(fontSize: 22);
final TextStyle subTitleText = GoogleFonts.fredoka(fontSize: 18);
final TextStyle nameText = GoogleFonts.fredoka(fontSize: 16);
final TextStyle subNameText = GoogleFonts.fredoka(fontSize: 14);
final TextStyle detailText = GoogleFonts.fredoka(fontSize: 12);

// Theme
const themeColor = ColorScheme(
  brightness: Brightness.dark,
  primary: lightRedColor,
  primaryContainer: lightRedColor,
  onPrimary: blackColor,
  secondary: blackColor,
  onSecondary: whiteColor,
  error: bloodRedColor,
  onError: whiteColor,
  background: blackColor,
  onBackground: whiteColor,
  surface: blackColor,
  onSurface: whiteColor,
);
