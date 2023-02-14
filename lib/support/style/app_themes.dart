import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static final ThemeData theme = ThemeData(
    colorScheme: ColorScheme.dark(secondary: AppColors.darkGreen),
    splashColor: AppColors.transparent,
    highlightColor: AppColors.transparent,
    scaffoldBackgroundColor: AppColors.darkGray,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      enableFeedback: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.darkerGray,
      selectedItemColor: AppColors.lightGreen,
    ),
  );
}
