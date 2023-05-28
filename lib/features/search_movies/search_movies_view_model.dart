import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localize.dart';

import '../../../models/movie.dart';
import 'item/search_movies_item_view.dart';
import 'item/search_movies_item_view_model.dart';
import 'search_movies_view_controller.dart';
import 'use_cases/search_movies_use_case.dart';

class SearchMoviesViewModel extends SearchMoviesProtocol implements SearchMoviesItemViewModelDelegate {
  final _scrollController = ScrollController();
  String _query = '';
  int _page = 1;
  bool _isLoading = false;
  bool _isRefreshLoading = false;
  String? _errorMessage;
  List<Movie> _listMovies = [];
  Timer? _countDown;

  final Localization l10n;
  final SearchMoviesUseCaseProtocol searchMoviesUseCase;

  SearchMoviesViewModel({
    required this.l10n,
    required this.searchMoviesUseCase,
  }) {
    _addListenerToScrollController();
  }

  @override
  bool get isLoading => _isLoading;

  @override
  String? get errorMessage => _errorMessage;

  @override
  ScrollController get scrollController => _scrollController;

  @override
  bool get isRefreshLoading => _isRefreshLoading;

  @override
  void onChangeText(String text) {
    if (_countDown?.isActive ?? false) _countDown?.cancel();

    _countDown = Timer(const Duration(seconds: 1), () => searchMovies(query: text));
  }

  @override
  List<SearchMoviesItemViewModelProtocol> get itemViewModels {
    return _listMovies.map((movie) {
      return SearchMoviesItemViewModel(
        delegate: this,
        movie: movie,
      );
    }).toList();
  }

  @override
  void didTapMovieDetails(Movie movie) {
    onTapMovieDetails?.call(movie);
  }

  void searchMovies({required String query, bool isRefreshLoading = false}) {
    if (query.isEmpty) {
      _listMovies = [];
      notifyListeners();
      return;
    }

    _query = query;
    _setLoading(true, isRefreshLoading: isRefreshLoading);

    searchMoviesUseCase.execute(
      page: _page,
      query: query,
      success: (movies) {
        _listMovies.addAll(movies);
        _setLoading(false, isRefreshLoading: isRefreshLoading);
      },
      failure: (error) {
        _errorMessage = error.description;
        _setLoading(false, isRefreshLoading: isRefreshLoading);
      },
    );
  }

  void _addListenerToScrollController() {
    _scrollController.addListener(() {
      if (_scrollController.offset >= _scrollController.position.maxScrollExtent && !_isRefreshLoading) {
        _page++;
        searchMovies(query: _query, isRefreshLoading: true);
      }
    });
  }

  void _setLoading(bool isLoading, {bool isRefreshLoading = false}) {
    if (isRefreshLoading) {
      _isRefreshLoading = isLoading;
    } else {
      _isLoading = isLoading;
    }
    notifyListeners();
  }
}
