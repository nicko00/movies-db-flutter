import 'package:flutter/material.dart';
import '../../localization/localize.dart';
import '../../support/extensions/dialog_extensions.dart';
import 'movie_details_view.dart';

abstract class MovieDetailsProtocol extends MovieDetailsViewModelProtocol {
  Future<void> verifyFavoriteState();

  VoidCallback? onBackScreen;
  VoidCallback? onSuccessAddToFavorite;
  VoidCallback? onSuccessRemoveFromFavorite;
}

class MovieDetailsViewController extends StatefulWidget {
  final MovieDetailsProtocol viewModel;

  const MovieDetailsViewController({super.key, required this.viewModel});

  @override
  State<StatefulWidget> createState() => _MovieDetailsViewControllerState();
}

class _MovieDetailsViewControllerState extends State<MovieDetailsViewController> {
  final l10n = Localize.instance.l10n;

  @override
  void initState() {
    super.initState();
    widget.viewModel.verifyFavoriteState();
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
    widget.viewModel.onSuccessAddToFavorite = () {
      showDefaultSnackBar(
        message: l10n.alertMovieDetailsAddFavoriteTitle,
        duration: 5000,
      );
    };
    widget.viewModel.onSuccessRemoveFromFavorite = () {
      showDefaultSnackBar(
        message: l10n.alertMovieDetailsRemoveFavoriteTitle,
        duration: 5000,
      );
    };
  }
}
