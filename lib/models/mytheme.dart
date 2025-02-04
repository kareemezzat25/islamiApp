import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static Color primarycolor = const Color(0xFFE2BE7F);
  static Color blackColor = const Color(0xFF202020);
  static ThemeData lightTheme = ThemeData(
      primaryColor: primarycolor,
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
          titleLarge: GoogleFonts.aBeeZee(
              fontSize: 24, fontWeight: FontWeight.bold, color: primarycolor),
          titleSmall: GoogleFonts.aBeeZee(
              fontSize: 14, fontWeight: FontWeight.bold, color: primarycolor),
          bodyLarge: GoogleFonts.aBeeZee(
              fontSize: 20, fontWeight: FontWeight.bold, color: primarycolor),
          bodyMedium: GoogleFonts.aBeeZee(
              fontSize: 18, fontWeight: FontWeight.bold, color: primarycolor),
          bodySmall: GoogleFonts.aBeeZee(
              fontSize: 16, fontWeight: FontWeight.bold, color: primarycolor)),
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: primarycolor),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          titleTextStyle: GoogleFonts.aBeeZee(
              fontSize: 20, color: primarycolor, fontWeight: FontWeight.bold)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primarycolor,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: blackColor));
}
