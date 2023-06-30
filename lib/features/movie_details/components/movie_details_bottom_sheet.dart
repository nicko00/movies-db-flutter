import 'package:flutter/material.dart';

import '../../../support/style/app_colors.dart';
import '../../../support/style/app_fonts.dart';
import 'movie_details_bottom_sheet_overview.dart';
import 'movie_from_db_tag.dart';
import 'rating_star_indicator.dart';

class MovieDetailsBottomSheet extends StatelessWidget {
  final String title;
  final bool isFromDb;
  final double rating;
  final String overview;
  final String releaseDate;

  const MovieDetailsBottomSheet({
    super.key,
    required this.title,
    required this.rating,
    required this.overview,
    required this.releaseDate,
    this.isFromDb = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.darkerGray,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: AppColors.darkerGray),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Visibility(
                visible: isFromDb,
                child: const MovieFromDbTag(),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 72,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: AppFonts.montserratMedium(20, color: AppColors.white),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingStarIndicator(rating: rating),
                        const SizedBox(width: 8),
                        Text(
                          rating.toStringAsFixed(1),
                          style: AppFonts.montserratMedium(16, color: AppColors.gray),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      releaseDate,
                      style: AppFonts.montserratMedium(16, color: AppColors.gray),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (overview.isNotEmpty) MovieDetailsBottomSheetOverview(overview: overview),
      ],
    );
  }
}
