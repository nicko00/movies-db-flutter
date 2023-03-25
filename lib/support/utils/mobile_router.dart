import 'package:flutter/material.dart';

import '../../features/home/home_factory.dart';
import '../../features/movie_details/movie_details_factory.dart';
import '../../features/search_movies/search_movies_factory.dart';
import '../../models/movie.dart';

class MobileRouter {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static const String initialRoute = HomeFactory.route;

  static final Map<String, WidgetBuilder> routes = {
    HomeFactory.route: (_) => HomeFactory.home(),
    MovieDetailsFactory.route: (context) {
      final movie = ModalRoute.of(context)?.settings.arguments as Movie;
      return MovieDetailsFactory.movieDetails(movie: movie);
    },
    SearchMoviesFactory.route: (_) => SearchMoviesFactory.search(),
  };
}
