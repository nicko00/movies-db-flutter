import 'package:flutter/material.dart';

import '../../../../support/components/default_image_network.dart';
import '../../../../support/style/app_colors.dart';
import '../../../../support/style/app_fonts.dart';

abstract class MovieCarouselItemViewModelProtocol with ChangeNotifier {
  String get title;
  String get imageUrl;
  double get cardScale;
}

class MovieCarouselItemView extends StatelessWidget {
  final MovieCarouselItemViewModelProtocol itemViewModel;

  const MovieCarouselItemView({super.key, required this.itemViewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultImageNetwork(
          height: 200,
          width: 160,
          scale: itemViewModel.cardScale,
          imageUrl: itemViewModel.imageUrl,
        ),
        Text(
          itemViewModel.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: AppFonts.montserratMedium(16, color: AppColors.white),
        ),
      ],
    );
  }
}
