import 'package:flutter/material.dart';

import '../../models/movie.dart';
import '../../support/extensions/dialog_extensions.dart';
import '../movie_details/models/movie_details.dart';
import '../movie_details/movie_details_factory.dart';
import 'profile_view.dart';

abstract class ProfileProtocol extends ProfileViewModelProtocol {
  void loadContent();
  void uploadCameraImage();
  void uploadGalleryImage();

  VoidCallback? onTapPhoto;
  VoidCallback? onSuccessUploadPhoto;
  void Function(String errorMessage)? onFailureGetPhoto;
  void Function(String errorMessage)? onFailureUploadPhoto;
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
    if (mounted) _bind();
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
    widget.viewModel.onTapPhoto = () {
      showDefaultBottomSheet(
        title: 'Perfil',
        description: 'O que deseja fazer?',
        primaryButtonText: 'Escolher foto da galeria',
        secondaryButtonText: 'Tirar foto',
        onTapPrimaryButton: widget.viewModel.uploadGalleryImage,
        onTapSecondaryButton: widget.viewModel.uploadCameraImage,
      );
    };
    widget.viewModel.onSuccessUploadPhoto = () {
      _goBackStack();
      showDefaultSnackBar(message: 'Imagem enviada com sucesso!');
    };
    widget.viewModel.onFailureUploadPhoto = (errorMessage) {
      _goBackStack();
      showDefaultBottomSheet(
        title: 'Não foi possível enviar a imagem',
        description: errorMessage,
        primaryButtonText: 'Ok',
        onTapPrimaryButton: Navigator.of(context).pop,
      );
    };
    widget.viewModel.onFailureGetPhoto = (error) {
      showDefaultSnackBar(message: error);
    };
  }

  void _goBackStack() {
    Navigator.pop(context);
  }
}
