import 'package:flutter/material.dart';

import 'movies_carousel_view.dart';

abstract class MoviesCarouselProtocol extends MoviesCarouselViewModelProtocol {
  void getMovies();
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
    widget.viewModel.addListenerPageController();
    widget.viewModel.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return MoviesCarouselView(viewModel: widget.viewModel);
  }
}
