import 'package:flutter/material.dart';

import '../../models/movie.dart';
import '../../support/utils/cache_manager.dart';
import 'movie_details_view_controller.dart';
import 'movie_details_view_model.dart';

class MovieDetailsFactory {
  static const String route = '/movie_details';

  static StatefulWidget movieDetails({required Movie movie}) {
    final sharedPreferences = CacheManager.instance;
    final viewModel = MovieDetailsViewModel(
      movie: movie,
      sharedPreferences: sharedPreferences,
    );

    return MovieDetailsViewController(viewModel: viewModel);
  }
}
