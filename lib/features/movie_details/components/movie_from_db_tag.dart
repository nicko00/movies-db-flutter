import 'package:flutter/material.dart';

import '../../../support/style/app_colors.dart';
import '../../../support/style/app_fonts.dart';

class MovieFromDbTag extends StatelessWidget {
  const MovieFromDbTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(
          color: AppColors.white30,
          width: 0.6,
        ),
      ),
      child: Text(
        'Dados não atualizáveis',
        style: AppFonts.montserratRegular(
          12,
          color: AppColors.white,
        ),
      ),
    );
  }
}
