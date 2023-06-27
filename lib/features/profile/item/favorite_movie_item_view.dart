import 'package:flutter/material.dart';

import '../../../support/components/default_image_network.dart';
import '../../../support/style/app_colors.dart';
import '../../../support/style/app_fonts.dart';

abstract class FavoriteMovieItemViewModelProtocol with ChangeNotifier {
  void didTapFavorite();
  void didTapMovieItem();

  String get title;
  String get imageUrl;
}

class FavoriteMovieItemView extends StatelessWidget {
  final FavoriteMovieItemViewModelProtocol itemViewModel;

  const FavoriteMovieItemView({super.key, required this.itemViewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: AppColors.black50,
          ),
          child: Row(
            children: [
              DefaultImageNetwork(
                width: 120,
                height: 200,
                imageUrl: itemViewModel.imageUrl,
              ),
              const SizedBox(height: 20),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    itemViewModel.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.montserratBold(16, color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
