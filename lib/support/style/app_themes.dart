import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppThemes {
  static final ThemeData theme = ThemeData(
    splashColor: AppColors.white10,
    colorScheme: ColorScheme.dark(secondary: AppColors.darkGreen),
    scaffoldBackgroundColor: AppColors.darkGray,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        enableFeedback: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.darkerGray,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.white30),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.white,
        fixedSize: const Size.fromHeight(46),
        disabledBackgroundColor: AppColors.gray,
        textStyle: AppFonts.montserratMedium(12, color: AppColors.black),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.black50,
    ),
  );
}
