import 'package:flutter/material.dart';

import '../../../support/components/placeholders/loading_view.dart';
import '../../../support/style/app_colors.dart';
import '../../../support/style/app_fonts.dart';
import 'item/movie_carousel_item_view.dart';

abstract class MoviesCarouselViewModelProtocol with ChangeNotifier {
  bool get isLoading;
  String get errorMessage;
  bool get isRefreshLoading;
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
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: _bodyWidget,
        );
      },
    );
  }

  Widget get _bodyWidget {
    if (viewModel.isLoading) return const LoadingView();

    if (viewModel.errorMessage.isNotEmpty) {
      return Center(
        child: Text(
          viewModel.errorMessage,
          style: AppFonts.playfairMedium(16, color: AppColors.red),
        ),
      );
    }

    return Stack(
      alignment: Alignment.centerRight,
      children: [
        SizedBox(
          height: 280,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            onPageChanged: viewModel.setIndex,
            controller: viewModel.pageViewController,
            itemCount: viewModel.itemViewModels.length,
            itemBuilder: (_, index) {
              final itemViewModel = viewModel.itemViewModels[index];

              return MovieCarouselItemView(itemViewModel: itemViewModel);
            },
          ),
        ),
        Positioned(
          right: 0,
          child: Visibility(
            visible: viewModel.isRefreshLoading,
            child: const LoadingView(),
          ),
        ),
      ],
    );
  }
}
