import '../../../models/movie.dart';
import '../../../support/extensions/string_extensions.dart';
import '../../support/utils/cache_manager.dart';
import 'movie_details_view_controller.dart';

class MovieDetailsViewModel extends MovieDetailsProtocol {
  final Movie movie;
  final CacheManagerProtocol sharedPreferences;

  MovieDetailsViewModel({required this.movie, required this.sharedPreferences});

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
  Future<bool> get isFavorite async {
    final favoritesList = await sharedPreferences.getFavorites();

    return favoritesList.contains(Movie.fromMap({'id': movie.id}));
  }

  @override
  void didTapGoBack() {
    onBackScreen?.call();
  }

  @override
  void didTapFavorite() {
    sharedPreferences.setFavorite(movie);
  }
}
