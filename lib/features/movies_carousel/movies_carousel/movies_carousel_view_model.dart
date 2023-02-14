import 'package:flutter/material.dart';

import '../../../models/movie.dart';
import '../use_cases/get_movies_use_case.dart';
import 'item/movie_carousel_item_view.dart';
import 'item/movie_carousel_item_view_model.dart';
import 'movies_carousel_view_controller.dart';

class MoviesCarouselViewModel extends MoviesCarouselProtocol implements MovieCarouselItemViewModelDelegate {
  int _currentIndex = 0;
  List<Movie>? _listMovies;
  bool _isLoading = false;
  String _errorMessage = '';

  final PageController pageController;
  final GetMoviesUseCaseProtocol getMoviesUseCase;

  MoviesCarouselViewModel({required this.pageController, required this.getMoviesUseCase});

  @override
  String get errorMessage => _errorMessage;

  @override
  bool get isLoading => _isLoading;

  @override
  List<MovieCarouselItemViewModelProtocol> get itemViewModels {
    final movies = _listMovies ?? [];

    return movies.map((movie) {
      return MovieCarouselItemViewModel(
        delegate: this,
        movie: movie,
        currentCard: _currentIndex,
        indexCard: movies.indexOf(movie),
      );
    }).toList();
  }

  @override
  PageController get pageViewController => pageController;

  @override
  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  @override
  void getMovies() {
    _setLoading(true);

    getMoviesUseCase.execute(
      success: (response) {
        _listMovies = response;
        _setLoading(false);
      },
      failure: (error) {
        _errorMessage = error.description;
        _setLoading(false);
      },
    );
  }

  @override
  void addListenerPageController() {
    pageController.addListener(notifyListeners);
  }

  void _setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  @override
  void didTapMovieDetails(Movie movie) {
    onTapMovieDetails?.call(movie);
  }
}
