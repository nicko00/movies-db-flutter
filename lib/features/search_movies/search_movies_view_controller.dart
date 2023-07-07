import 'package:flutter/material.dart';

import '../../../models/movie.dart';
import '../movie_details/models/movie_details.dart';
import '../movie_details/movie_details_factory.dart';
import 'search_movies_view.dart';

abstract class SearchMoviesProtocol extends SearchMoviesViewModelProtocol {
  void Function(Movie movie)? onTapMovieDetails;
}

class SearchMoviesViewController extends StatefulWidget {
  final SearchMoviesProtocol viewModel;

  const SearchMoviesViewController({super.key, required this.viewModel});

  @override
  State<StatefulWidget> createState() => _SearchMoviesViewControllerState();
}

class _SearchMoviesViewControllerState extends State<SearchMoviesViewController> {
  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchMoviesView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapMovieDetails = (movie) {
      Navigator.pushNamed(
        context,
        MovieDetailsFactory.route,
        arguments: MovieDetails(movie: movie),
      );
    };
  }
}
