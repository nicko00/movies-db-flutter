import 'package:flutter/material.dart';

import 'search_movies_view.dart';

abstract class SearchMoviesProtocol extends SearchMoviesViewModelProtocol {}

class SearchMoviesViewController extends StatefulWidget {
  final SearchMoviesProtocol viewModel;

  const SearchMoviesViewController({super.key, required this.viewModel});

  @override
  State<StatefulWidget> createState() => _SearchMoviesViewControllerState();
}

class _SearchMoviesViewControllerState extends State<SearchMoviesViewController> {
  @override
  Widget build(BuildContext context) {
    return SearchMoviesView(viewModel: widget.viewModel);
  }
}
