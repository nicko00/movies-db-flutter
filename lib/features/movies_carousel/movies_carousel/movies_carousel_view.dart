import 'package:flutter/material.dart';

import '../../../support/components/placeholders/loading_view.dart';
import '../../../support/style/app_colors.dart';
import '../../../support/style/app_fonts.dart';
import 'item/movie_carousel_item_view.dart';

abstract class MoviesCarouselViewModelProtocol with ChangeNotifier {
  bool get isLoading;
  String get errorMessage;
  PageController get pageViewController;
  List<MovieCarouselItemViewModelProtocol> get itemViewModels;

  void setIndex(int index);
}

class MoviesCarouselView extends StatelessWidget {
  final MoviesCarouselViewModelProtocol viewModel;

  const MoviesCarouselView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (_, __) {
        if (viewModel.isLoading) return const LoadingView();
        if (viewModel.errorMessage.isNotEmpty) {
          return Center(
            child: Text(
              viewModel.errorMessage,
              style: AppFonts.playfairMedium(16, color: AppColors.red),
            ),
          );
        }

        return Expanded(
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            onPageChanged: viewModel.setIndex,
            padEnds: false,
            controller: viewModel.pageViewController,
            itemCount: viewModel.itemViewModels.length,
            itemBuilder: (_, index) {
              final itemViewModel = viewModel.itemViewModels[index];

              return MovieCarouselItemView(itemViewModel: itemViewModel);
            },
          ),
        );
      },
    );
  }
}
