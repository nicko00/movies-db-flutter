import 'package:flutter/material.dart';

import 'movies_list_view.dart';

abstract class MoviesListProtocol extends MoviesListViewModelProtocol{}

class MoviesListViewController extends StatefulWidget {
  const MoviesListViewController({super.key});

  @override
  State<StatefulWidget> createState() => _MoviesListViewControllerState();
}

class _MoviesListViewControllerState extends State<MoviesListViewController> {
  @override
  Widget build(BuildContext context) {
    return MoviesListView();
  }
}
