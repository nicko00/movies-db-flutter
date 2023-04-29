import 'package:flutter/material.dart';

import '../../../models/movie.dart';
import '../use_cases/get_movies_use_case.dart';
import 'item/movie_carousel_item_view.dart';
import 'item/movie_carousel_item_view_model.dart';
import 'movies_carousel_view_controller.dart';

class MoviesCarouselViewModel extends MoviesCarouselProtocol implements MovieCarouselItemViewModelDelegate {
  final List<Movie> _listMovies = [];
  int _currentIndex = 0;
  bool _isLoading = false;
  bool _isRefreshLoading = false;
  int _page = 1;
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
    return _listMovies.map((movie) {
      return MovieCarouselItemViewModel(
        delegate: this,
        movie: movie,
        currentCard: _currentIndex,
        indexCard: _listMovies.indexOf(movie),
      );
    }).toList();
  }

  @override
  PageController get pageViewController => pageController;
  
  @override
  bool get isRefreshLoading => _isRefreshLoading;

  @override
  void setIndex(int index) {
    _currentIndex = index;
    if (_currentIndex + 1 == itemViewModels.length && !_isLoading) {
      _page++;
      getMovies(isRefresh: true);
    }
    notifyListeners();
  }

  @override
  void getMovies({bool isRefresh = false}) {
    _setLoading(true, isRefresh: isRefresh);

    getMoviesUseCase.execute(
      page: _page,
      success: (response) {
        _listMovies.addAll(response);
        _setLoading(false, isRefresh: isRefresh);
      },
      failure: (error) {
        _errorMessage = error.description;
        _setLoading(false, isRefresh: isRefresh);
      },
    );
  }

  @override
  void addListenerPageController() {
    pageController.addListener(notifyListeners);
  }

  @override
  void didTapMovieDetails(Movie movie) {
    onTapMovieDetails?.call(movie);
  }

  void _setLoading(bool isLoading, {bool isRefresh = false}) {
    if (isRefresh) {
      _isRefreshLoading = isLoading;
    } else {
      _isLoading = isLoading;
    }
    
    notifyListeners();
  }
}
