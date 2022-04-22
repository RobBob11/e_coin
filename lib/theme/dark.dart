import 'package:e_coin/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class DarkTheme implements CustomTheme {
  @override
  AppBarTheme appBarTheme = AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: HexColor("#191D2D"),
      actionsIconTheme: const IconThemeData(color: Colors.white, size: 23.0));

  @override
  BottomNavigationBarThemeData bottomNavigationBarThemeData =
      BottomNavigationBarThemeData(
          backgroundColor: HexColor("#191D2D"),
          selectedItemColor: HexColor("#4054E9"),
          unselectedItemColor: HexColor("#747E98"),
          selectedLabelStyle: TextStyle(
            color: HexColor("#4054E9"),
            fontSize: 12,
          ));

  @override
  CardTheme cardTheme = CardTheme(
    shadowColor: Colors.grey,
    elevation: 1.0,
    color: HexColor("#191D2D"),
  );

  @override
  ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(HexColor("#4054E9")),
    fixedSize: MaterialStateProperty.all<Size>(const Size(100, 10)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(color: Colors.white)),
  ));

  @override
  Color scaffoldColor = HexColor("#191D2D");

  @override
  TextTheme textTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
        fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
    headline2: GoogleFonts.montserrat(
        fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
    headline3: GoogleFonts.montserrat(
        fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
    headline4: GoogleFonts.montserrat(
        fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
    bodyText1: GoogleFonts.montserrat(
        fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white),
  );
}