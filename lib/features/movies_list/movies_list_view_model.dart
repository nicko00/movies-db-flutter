import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localize.dart';

import '../../../support/components/default_image_network.dart';
import '../../../support/components/placeholders/error_view.dart';
import '../../../support/components/placeholders/loading_view.dart';
import '../movies_carousel/use_cases/get_movies_use_case.dart';
import 'movies_list_view_controller.dart';

class MoviesListViewModel extends MoviesListProtocol {
  int _currentIndex = 0;
  final List<Widget> _movieImages = [];

  final Localization l10n;
  final GetMoviesUseCaseProtocol getMoviesUseCase;

  MoviesListViewModel({required this.l10n, required this.getMoviesUseCase});

  @override
  List<Widget> get imagesList => _movieImages;

  @override
  int get currentIndex => _currentIndex;

  @override
  void getMovies() {
    _setListWidgets(const LoadingView());
    getMoviesUseCase.execute(
      page: 1,
      success: (movies) {
        _movieImages.clear();
        for (var i = 0; i < 3; i++) {
          _setListWidgets(
            DefaultImageNetwork(
              scale: 1,
              imageUrl: movies[i].posterUrl,
            ),
          );
        }
        notifyListeners();
      },
      failure: (_) {
        _movieImages.clear();
        _setListWidgets(ErrorView(errorMessage: l10n.carouselSliderImageError));
        notifyListeners();
      },
    );
  }

  @override
  void didChangeCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void _setListWidgets(Widget imageWidget) {
    _movieImages.add(imageWidget);
  }
}