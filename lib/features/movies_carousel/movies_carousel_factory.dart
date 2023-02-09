import 'package:flutter/material.dart';

import '../../api/routes/movies_routes.dart';
import 'movies_carousel/movies_carousel_view_controller.dart';
import 'movies_carousel/movies_carousel_view_model.dart';
import 'use_cases/get_movies_use_case.dart';

class MoviesCarouselFactory {
  static const latestMoviesPath = '/movie/now_playing';
  static const mostPopularMoviesPath = '/movie/popular';
  static const topRatedMoviesPath = '/movie/top_rated';
  static const upcomingMoviesPath = '/movie/upcoming';
  
  static StatefulWidget latestMoviesCarousel() {
    final routes = MoviesRoutes();
    final pageController = PageController(viewportFraction: 0.35);
    final getLatestMoviesUseCase = GetMoviesUseCase(
      routes: routes,
      moviesPath: latestMoviesPath,
    );

    final viewModel = MoviesCarouselViewModel(
      getMoviesUseCase: getLatestMoviesUseCase,
      pageController: pageController,
    );

    return MoviesCarouselViewController(viewModel: viewModel);
  }

    static StatefulWidget mostPopularMoviesCarousel() {
    final routes = MoviesRoutes();
    final pageController = PageController(viewportFraction: 0.35);
    final getLatestMoviesUseCase = GetMoviesUseCase(
      routes: routes,
      moviesPath: mostPopularMoviesPath,
    );

    final viewModel = MoviesCarouselViewModel(
      getMoviesUseCase: getLatestMoviesUseCase,
      pageController: pageController,
    );

    return MoviesCarouselViewController(viewModel: viewModel);
  }
  
    static StatefulWidget topRatedMoviesCarousel() {
    final routes = MoviesRoutes();
    final pageController = PageController(viewportFraction: 0.35);
    final getLatestMoviesUseCase = GetMoviesUseCase(
      routes: routes,
      moviesPath: topRatedMoviesPath,
    );

    final viewModel = MoviesCarouselViewModel(
      getMoviesUseCase: getLatestMoviesUseCase,
      pageController: pageController,
    );

    return MoviesCarouselViewController(viewModel: viewModel);
  }

    static StatefulWidget upcomingMoviesCarousel() {
    final routes = MoviesRoutes();
    final pageController = PageController(viewportFraction: 0.35);
    final getLatestMoviesUseCase = GetMoviesUseCase(
      routes: routes,
      moviesPath: upcomingMoviesPath,
    );

    final viewModel = MoviesCarouselViewModel(
      getMoviesUseCase: getLatestMoviesUseCase,
      pageController: pageController,
    );

    return MoviesCarouselViewController(viewModel: viewModel);
  }
}
