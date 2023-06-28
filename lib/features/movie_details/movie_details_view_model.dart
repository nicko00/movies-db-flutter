import '../../../models/movie.dart';
import '../../../support/extensions/string_extensions.dart';
import '../../support/utils/cache_manager.dart';
import 'movie_details_view_controller.dart';

class MovieDetailsViewModel extends MovieDetailsProtocol {
  bool _isFavorite = false;

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
  bool get isFavorite => _isFavorite;

  @override
  void didTapGoBack() {
    onBackScreen?.call();
  }

  @override
  void didTapAddFavorite() {
    sharedPreferences.setFavorite(movie).whenComplete(() {
      onSuccessAddToFavorite?.call();
      _setFavoriteState(true);
    });
  }

  @override
  void didTapRemoveFavorite() {
    sharedPreferences.deleteFavorite(movie).whenComplete(() {
      onSuccessRemoveFromFavorite?.call();
      _setFavoriteState(false);
    });
  }

  @override
  Future<void> verifyFavoriteState() async {
    final favoritesList = await sharedPreferences.getFavorites();
    for (final favorite in favoritesList) {
      if (favorite.id == movie.id) {
        _setFavoriteState(true);
        break;
      } else {
        _setFavoriteState(false);
      }
    }
  }

  void _setFavoriteState(bool state) {
    _isFavorite = state;
    notifyListeners();
  }
}
