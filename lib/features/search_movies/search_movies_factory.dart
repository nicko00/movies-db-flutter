import 'package:flutter/material.dart';

import '../../api/routes/movies_routes.dart';
import '../../localization/localize.dart';
import 'search_movies_view_controller.dart';
import 'search_movies_view_model.dart';
import 'use_cases/search_movies_use_case.dart';

class SearchMoviesFactory {
  static const String route = '/search';
  static StatefulWidget search() {
    final l10n = Localize.instance.l10n;
    final routes = MoviesRoutes();
    final searchMoviesUseCase = SearchMoviesUseCase(routes: routes);
    final viewModel = SearchMoviesViewModel(
      l10n: l10n,
      searchMoviesUseCase: searchMoviesUseCase,
    );

    return SearchMoviesViewController(viewModel: viewModel);
  }
}
