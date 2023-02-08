import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_fonts.dart';

class DefaultMoviesListTitle extends StatelessWidget {
  final String title;
  final double padding;

  const DefaultMoviesListTitle({
    super.key,
    this.padding = 8,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Text(
        title,
        style: AppFonts.playfairMedium(16, color: AppColors.green),
      ),
    );
  }
}
