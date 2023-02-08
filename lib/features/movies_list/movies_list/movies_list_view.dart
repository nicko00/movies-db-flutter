import 'package:flutter/material.dart';

import '../../../localization/localize.dart';
import '../../../support/components/default_movies_list_title.dart';
import '../../../support/components/default_screen.dart';
import '../../movies_carousel/movies_carousel_factory.dart';

abstract class MoviesListViewModelProtocol with ChangeNotifier {}

class MoviesListView extends StatelessWidget {
  const MoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return DefaultScreen(
      padding: const EdgeInsets.all(0),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DefaultMoviesListTitle(title: l10n.latestMoviesTitle),
            const SizedBox(height: 16),
            MoviesCarouselFactory.latestMoviesCarousel(),
          ],
        ),
      ),
    );
  }
}
