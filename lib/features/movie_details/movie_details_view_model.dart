import '../../../models/movie.dart';
import '../../../support/extensions/string_extensions.dart';
import 'movie_details_view_controller.dart';

class MovieDetailsViewModel extends MovieDetailsProtocol {
  final Movie movie;

  MovieDetailsViewModel({required this.movie});

  @override
  String get movieDescription => movie.description;

  @override
  String get moviePosterUrl => movie.posterUrl;

  @override
  double get movieRating => movie.rating.toDouble();

  @override
  String get movieTitle => movie.title;

  @override
  String get movieReleaseDate => movie.releaseDate.toFormattedDateString;

  @override
  void didTapGoBack() {
    onBackScreen?.call();
  }
}
