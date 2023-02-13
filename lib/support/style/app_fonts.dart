import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  AppFonts._();

  static TextStyle playfairRegular(double fontSize, {Color? color, double? height}) {
    return GoogleFonts.playfairDisplay(
      color: color,
      fontSize: fontSize,
      height: height ?? 1.5,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle playfairMedium(double fontSize, {Color? color, double? height}) {
    return GoogleFonts.playfairDisplay(
      color: color,
      fontSize: fontSize,
      height: height ?? 1.5,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle playfairBold(double fontSize, {Color? color, double? height}) {
    return GoogleFonts.playfairDisplay(
      color: color,
      fontSize: fontSize,
      height: height ?? 1.5,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle montserratRegular(double fontSize, {Color? color, double? height}) {
    return GoogleFonts.montserrat(
      color: color,
      fontSize: fontSize,
      height: height ?? 1.5,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle montserratMedium(double fontSize, {Color? color, double? height}) {
    return GoogleFonts.montserrat(
      color: color,
      fontSize: fontSize,
      height: height ?? 1.5,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle montserratBold(double fontSize, {Color? color, double? height}) {
    return GoogleFonts.montserrat(
      color: color,
      fontSize: fontSize,
      height: height ?? 1.5,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.none,
    );
  }
}
