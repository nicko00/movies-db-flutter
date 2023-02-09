import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../localization/localize.dart';
import '../../../support/components/default_movies_list_title.dart';
import '../../../support/components/default_screen.dart';
import '../../../support/style/app_colors.dart';
import '../../movies_carousel/movies_carousel_factory.dart';

abstract class MoviesListViewModelProtocol with ChangeNotifier {
  int get currentIndex;
  List<Widget> get imagesList;

  void didTapIndicatorIndex(int index);
}

class MoviesListView extends StatelessWidget {
  final MoviesListViewModelProtocol viewModel;

  const MoviesListView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return DefaultScreen(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedBuilder(
            animation: viewModel,
            builder: (_, __) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider(
                    items: viewModel.imagesList,
                    options: CarouselOptions(
                      height: 600,
                      padEnds: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 8),
                      viewportFraction: 1,
                      onPageChanged: (index, _) {
                        viewModel.didTapIndicatorIndex(index);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: viewModel.imagesList.map((image) {
                      final index = viewModel.imagesList.indexOf(image);
                      return Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 4,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _indicatorColor(index),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              );
            },
          ),
          DefaultMoviesListTitle(title: l10n.latestMoviesTitle),
          const SizedBox(height: 16),
          MoviesCarouselFactory.latestMoviesCarousel(),
        ],
      ),
    );
  }

  Color _indicatorColor(int index) {
    return viewModel.currentIndex == index ? AppColors.green : AppColors.gray;
  }
}
