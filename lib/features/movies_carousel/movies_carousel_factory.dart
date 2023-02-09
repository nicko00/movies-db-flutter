import 'package:flutter/material.dart';

import '../../api/routes/movies_routes.dart';
import 'movies_carousel/movies_carousel_view_controller.dart';
import 'movies_carousel/movies_carousel_view_model.dart';
import 'use_cases/get_movies_use_case.dart';

class MoviesCarouselFactory {
  static const moviesPath = '/movie/now_playing';
  
  static StatefulWidget latestMoviesCarousel() {
    final routes = MoviesRoutes();
    final pageController = PageController(viewportFraction: 0.35);
    final getLatestMoviesUseCase = GetMoviesUseCase(
      routes: routes,
      moviesPath: moviesPath,
    );

    final viewModel = MoviesCarouselViewModel(
      getMoviesUseCase: getLatestMoviesUseCase,
      pageController: pageController,
    );

    return MoviesCarouselViewController(viewModel: viewModel);
  }
}
