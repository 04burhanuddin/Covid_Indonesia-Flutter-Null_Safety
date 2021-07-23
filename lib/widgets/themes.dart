import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// colors
Color textColor = Colors.black;
Color textPositif = Colors.red;
Color textDirawat = Colors.blue;
Color textSembuh = Colors.green;
Color textMeniggal = Color(0xFFFBC02D);
Color gradientStrt = Color(0xffF04141);
Color gradientEnd = Colors.white;
Color colorCard = Colors.white;

// text title
TextStyle textndonesia = GoogleFonts.roboto(
  fontSize: 27,
  color: Colors.black.withOpacity(0.6),
  fontWeight: FontWeight.bold,
);

// Text in card gridView
TextStyle positif = GoogleFonts.roboto(
  fontSize: 28,
  color: textPositif,
  fontWeight: FontWeight.w500,
);
TextStyle sembuh = GoogleFonts.roboto(
  fontSize: 28,
  color: textSembuh,
  fontWeight: FontWeight.w500,
);
TextStyle dirawat = GoogleFonts.roboto(
  fontSize: 28,
  color: textDirawat,
  fontWeight: FontWeight.w500,
);
TextStyle meninggal = GoogleFonts.roboto(
  fontSize: 28,
  color: textMeniggal,
  fontWeight: FontWeight.w500,
);
TextStyle textCard = GoogleFonts.roboto(
  fontSize: 15,
  color: textColor,
);

// Text row pencegahan
TextStyle textPencegahan = GoogleFonts.roboto(
  fontSize: 15,
  color: textColor,
  fontWeight: FontWeight.w400,
);
