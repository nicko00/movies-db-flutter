import 'package:flutter/material.dart';

import '../../../localization/localize.dart';
import '../../../support/style/app_colors.dart';
import '../../../support/style/app_fonts.dart';

class MovieDetailsBottomSheetOverview extends StatelessWidget {
  final String overview;

  const MovieDetailsBottomSheetOverview({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Text(
              l10n.movieDetailsBottomSheetOverviewTitle,
              style: AppFonts.montserratRegular(16, color: AppColors.white),
            ),
            const SizedBox(height: 16),
            Container(
              width: 32,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.green,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: AppColors.darkGray,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                overview,
                textAlign: TextAlign.justify,
                style: AppFonts.montserratRegular(16, color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
