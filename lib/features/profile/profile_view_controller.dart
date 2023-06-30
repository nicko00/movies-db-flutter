import 'package:flutter/material.dart';

import '../../models/movie.dart';
import '../movie_details/models/movie_details.dart';
import '../movie_details/movie_details_factory.dart';
import 'profile_view.dart';

abstract class ProfileProtocol extends ProfileViewModelProtocol {
  void loadContent();

  void Function(Movie movie)? onTapMovieDetails;
}

class ProfileViewController extends StatefulWidget {
  final ProfileProtocol viewModel;

  const ProfileViewController({super.key, required this.viewModel});

  @override
  State<ProfileViewController> createState() => _ProfileViewControllerState();
}

class _ProfileViewControllerState extends State<ProfileViewController> {
  @override
  void initState() {
    super.initState();
    _bind();
    widget.viewModel.loadContent();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapMovieDetails = (movie) {
      Navigator.pushNamed(
        context,
        MovieDetailsFactory.route,
        arguments: MovieDetails(movie: movie, isFromDb: true),
      ).then((_) => widget.viewModel.loadContent());
    };
  }
}
