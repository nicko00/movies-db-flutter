import 'package:flutter/material.dart';

import '../../../../support/components/default_image_network.dart';

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
    return InkWell(
      onTap: itemViewModel.didTapMovieItem,
      child: DefaultImageNetwork(
        scale: 1,
        imageUrl: itemViewModel.imageUrl,
      ),
    );
  }
}
