import 'package:flutter/material.dart';
import 'movie_details_view.dart';

abstract class MovieDetailsProtocol extends MovieDetailsViewModelProtocol {
  VoidCallback? onBackScreen;
}

class MovieDetailsViewController extends StatefulWidget {
  final MovieDetailsProtocol viewModel;

  const MovieDetailsViewController({super.key, required this.viewModel});

  @override
  State<StatefulWidget> createState() => _MovieDetailsViewControllerState();
}

class _MovieDetailsViewControllerState
    extends State<MovieDetailsViewController> {
  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return MovieDetailsView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onBackScreen = () {
      Navigator.of(context).pop();
    };
  }
}
