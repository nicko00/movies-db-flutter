import 'package:flutter/material.dart';

import '../../../../support/components/default_image_network.dart';
import '../../../../support/style/app_colors.dart';
import '../../../../support/style/app_fonts.dart';

abstract class SearchMoviesItemViewModelProtocol with ChangeNotifier {
  String get title;
  String get imageUrl;

  void didTapMovieItem();
}

class SearchMoviesItemView extends StatelessWidget {
  final SearchMoviesItemViewModelProtocol itemViewModel;

  const SearchMoviesItemView({super.key, required this.itemViewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
      child: InkWell(
        onTap: itemViewModel.didTapMovieItem,
        child: SizedBox(
          height: 400,
          width: 200,
          child: Column(
            children: [
              DefaultImageNetwork(
                scale: 1,
                imageUrl: itemViewModel.imageUrl,
              ),
              Text(
                itemViewModel.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppFonts.montserratMedium(12, color: AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
