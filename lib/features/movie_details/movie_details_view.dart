import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../support/components/default_icon_button.dart';
import '../../support/components/default_image_network.dart';
import '../../support/components/default_screen.dart';
import '../../support/style/app_colors.dart';
import 'components/movie_details_bottom_sheet.dart';

abstract class MovieDetailsViewModelProtocol with ChangeNotifier {
  String get movieTitle;
  String get moviePosterUrl;
  String get movieDescription;
  String get movieReleaseDate;
  double get movieRating;
  bool get isFavorite;

  void didTapGoBack();
  void didTapAddFavorite();
  void didTapRemoveFavorite();
}

class MovieDetailsView extends StatelessWidget {
  final MovieDetailsViewModelProtocol viewModel;

  const MovieDetailsView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      padding: EdgeInsets.zero,
      hasTopSafeArea: false,
      child: SlidingUpPanel(
        color: AppColors.lighterBlack,
        parallaxEnabled: true,
        parallaxOffset: 0.2,
        minHeight: 252,
        maxHeight: 400,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        body: Stack(
          children: [
            DefaultImageNetwork(imageUrl: viewModel.moviePosterUrl),
            Positioned(
              top: 36,
              left: 8,
              child: DefaultIconButton(
                onTap: viewModel.didTapGoBack,
                icon: Icons.arrow_back_ios_new_rounded,
              ),
            ),
            Positioned(
              top: 36,
              right: 8,
              child: AnimatedBuilder(
                animation: viewModel,
                builder: (_, __) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: _favoriteIconWidget,
                  );
                },
              ),
            ),
          ],
        ),
        panel: MovieDetailsBottomSheet(
          title: viewModel.movieTitle,
          overview: viewModel.movieDescription,
          releaseDate: viewModel.movieReleaseDate,
          rating: viewModel.movieRating,
        ),
      ),
    );
  }

  Widget get _favoriteIconWidget {
    if (viewModel.isFavorite) {
      return DefaultIconButton(
        onTap: viewModel.didTapRemoveFavorite,
        icon: Icons.heart_broken_rounded,
      );
    }

    return DefaultIconButton(
      onTap: viewModel.didTapAddFavorite,
      icon: Icons.favorite,
    );
  }
}
