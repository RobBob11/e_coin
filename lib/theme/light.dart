import 'package:e_coin/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class LightTheme implements CustomTheme {
  @override
  AppBarTheme appBarTheme = const AppBarTheme(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      actionsIconTheme: IconThemeData(color: Colors.black, size: 23.0));

  @override
  BottomNavigationBarThemeData bottomNavigationBarThemeData =
      BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: HexColor("#4054E9"),
          unselectedItemColor: HexColor("#747E98"),
          selectedLabelStyle: TextStyle(
            color: HexColor("#4054E9"),
            fontSize: 12,
          ));

  @override
  CardTheme cardTheme = const CardTheme(
    shadowColor: Colors.grey,
    elevation: 1.0,
    color: Colors.white,
  );

  @override
  ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
    fixedSize: MaterialStateProperty.all<Size>(const Size(100, 10)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(color: Colors.white)),
  ));

  @override
  Color scaffoldColor = Colors.white;

  @override
  TextTheme textTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
        fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),
    headline2: GoogleFonts.montserrat(
        fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
    headline3: GoogleFonts.montserrat(
        fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
    headline4: GoogleFonts.montserrat(
        fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),
    bodyText1: GoogleFonts.montserrat(
        fontSize: 11, fontWeight: FontWeight.w500, color: Colors.black),
  );
}