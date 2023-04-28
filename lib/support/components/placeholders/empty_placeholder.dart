import 'package:flutter/material.dart';

import '../../style/app_colors.dart';
import '../../style/app_fonts.dart';

class EmptyPlaceholder extends StatelessWidget {
  final String message;
  final IconData icon;

  const EmptyPlaceholder({
    super.key,
    required this.message,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 2),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.darkerGray,
              ),
            ),
            Icon(
              icon,
              size: 24,
              color: AppColors.gray,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          message,
          style: AppFonts.playfairRegular(
            16,
            color: AppColors.gray,
          ),
        ),
        const Spacer(flex: 4),
      ],
    );
  }
}
