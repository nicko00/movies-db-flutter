import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static final ThemeData theme = ThemeData(
    splashColor: AppColors.transparent,
    highlightColor: AppColors.transparent,
    scaffoldBackgroundColor: AppColors.gray30,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      enableFeedback: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.darkGray,
      selectedItemColor: AppColors.lightGreen,
    ),
  );
}
