import 'package:flutter/material.dart';

import 'movies_list_view.dart';

abstract class MoviesListProtocol extends MoviesListViewModelProtocol {
  void getMovies();
}

class MoviesListViewController extends StatefulWidget {
  final MoviesListProtocol viewModel;

  const MoviesListViewController({super.key, required this.viewModel});

  @override
  State<StatefulWidget> createState() => _MoviesListViewControllerState();
}

class _MoviesListViewControllerState extends State<MoviesListViewController> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return MoviesListView(viewModel: widget.viewModel);
  }
}
