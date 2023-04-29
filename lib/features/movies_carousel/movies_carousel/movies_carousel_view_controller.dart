import 'package:flutter/material.dart';

import '../../../models/movie.dart';
import '../../movie_details/movie_details_factory.dart';
import 'movies_carousel_view.dart';

abstract class MoviesCarouselProtocol extends MoviesCarouselViewModelProtocol {
  void Function(Movie movie)? onTapMovieDetails;

  void getMovies({bool isRefresh = false});
  void addListenerPageController();
}

class MoviesCarouselViewController extends StatefulWidget {
  final MoviesCarouselProtocol viewModel;

  const MoviesCarouselViewController({super.key, required this.viewModel});

  @override
  State<StatefulWidget> createState() => _MoviesCarouselViewControllerState();
}

class _MoviesCarouselViewControllerState extends State<MoviesCarouselViewController> {
  @override
  void initState() {
    super.initState();
    _bind();
    widget.viewModel.addListenerPageController();
    widget.viewModel.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return MoviesCarouselView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapMovieDetails = (movie) {
      Navigator.of(context).pushNamed(MovieDetailsFactory.route, arguments: movie);
    };
  }
}
