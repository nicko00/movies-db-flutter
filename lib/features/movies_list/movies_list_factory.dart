import 'package:flutter/material.dart';

import '../../api/routes/movies_routes.dart';
import '../../localization/localize.dart';
import '../movies_carousel/use_cases/get_movies_use_case.dart';
import 'movies_list_view_controller.dart';
import 'movies_list_view_model.dart';

class MoviesListFactory {
  static const String route = '/movies_list';

  static StatefulWidget moviesListPage() {
    const moviesPath = '/movie/now_playing';
    final routes = MoviesRoutes();
    final l10n = Localize.instance.l10n;
    final getLatestMoviesUseCase = GetMoviesUseCase(
      routes: routes,
      moviesPath: moviesPath,
    );

    final viewModel = MoviesListViewModel(
      l10n: l10n,
      getMoviesUseCase: getLatestMoviesUseCase,
    );

    return MoviesListViewController(viewModel: viewModel);
  }
}
