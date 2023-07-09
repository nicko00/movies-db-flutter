import 'package:flutter/material.dart';

import '../../features/home/home_factory.dart';
import '../../features/menu/menu_factory.dart';
import '../../features/movie_details/models/movie_details.dart';
import '../../features/movie_details/movie_details_factory.dart';
import '../../features/profile/profile_factory.dart';
import '../../features/search_movies/search_movies_factory.dart';
import '../../features/settings/settings_factory.dart';
import '../../features/splash/splash_factory.dart';

class MobileRouter {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static const String initialRoute = SplashFactory.route;

  static final Map<String, WidgetBuilder> routes = {
    HomeFactory.route: (_) => HomeFactory.home(),
    MovieDetailsFactory.route: (context) {
      final arguments = ModalRoute.of(context)?.settings.arguments as MovieDetails;
      return MovieDetailsFactory.movieDetails(
        movie: arguments.movie,
        isFromDatabase: arguments.isFromDb,
      );
    },
    SearchMoviesFactory.route: (_) => SearchMoviesFactory.search(),
    SplashFactory.route: (_) => SplashFactory.splash(),
    MenuFactory.route: (_) => MenuFactory.menu(),
    ProfileFactory.route: (_) => ProfileFactory.profile(),
    SettingsFactory.route: (_) => SettingsFactory.settings(),
  };
}
