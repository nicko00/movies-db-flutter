import 'package:flutter/material.dart';

import '../../style/app_colors.dart';
import '../../style/app_fonts.dart';

class ErrorView extends StatelessWidget {
  final String errorMessage;

  const ErrorView({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: AppColors.darkGray,
          ),
          Text(
            errorMessage,
            style: AppFonts.montserratMedium(
              16,
              color: AppColors.red,
            ),
          ),
        ],
      ),
    );
  }
}
