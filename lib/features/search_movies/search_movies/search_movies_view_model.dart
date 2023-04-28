import 'dart:async';

import 'package:flutter_gen/gen_l10n/localize.dart';

import '../../../models/movie.dart';
import 'item/search_movies_item_view.dart';
import 'item/search_movies_item_view_model.dart';
import 'search_movies_view_controller.dart';
import 'use_cases/search_movies_use_case.dart';

class SearchMoviesViewModel extends SearchMoviesProtocol implements SearchMoviesItemViewModelDelegate {
  bool _isLoading = false;
  String? _errorMessage;
  List<Movie>? _listMovies;
  Timer? _countDown;

  final Localization l10n;
  final SearchMoviesUseCaseProtocol searchMoviesUseCase;

  SearchMoviesViewModel({required this.l10n, required this.searchMoviesUseCase});

  @override
  bool get isLoading => _isLoading;

  @override
  String? get errorMesssage => _errorMessage;

  @override
  void onChangeText(String text) {
    if (_countDown?.isActive ?? false) _countDown?.cancel();

    _countDown = Timer(const Duration(seconds: 1), () => searchMovies(text));
  }

  @override
  List<SearchMoviesItemViewModelProtocol> get itemViewModels {
    final movies = _listMovies ?? [];

    return movies.map((movie) {
      return SearchMoviesItemViewModel(
        delegate: this,
        movie: movie,
      );
    }).toList();
  }

  @override
  void didTapMovieDetails(Movie movie) {
    // TODO: implement didTapMovieDetails
  }

  void searchMovies(String query) {
    if (query.isEmpty) {
      _listMovies = [];
      notifyListeners();
      return;
    }

    _setLoading(true);

    searchMoviesUseCase.execute(
      query: query,
      success: (movies) {
        _listMovies = movies;
        _setLoading(false);
      },
      failure: (error) {
        _errorMessage = error.description;
        _setLoading(false);
      },
    );
  }

  void _setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
