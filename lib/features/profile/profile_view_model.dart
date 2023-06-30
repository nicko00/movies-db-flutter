import '../../models/movie.dart';
import '../../support/utils/cache_manager.dart';
import '../../support/utils/session_manager.dart';
import 'item/favorite_movie_item_view.dart';
import 'item/favorite_movie_item_view_model.dart';
import 'profile_view_controller.dart';

class ProfileViewModel extends ProfileProtocol implements FavoriteMovieItemViewModelDelegate {
  bool _isUserLoading = true;
  bool _isFavoritesLoading = false;
  String? _userName;
  List<Movie> _favoritesMoviesList = [];

  final SessionManagerProtocol sessionManager;
  final CacheManagerProtocol sharedPreferences;

  ProfileViewModel({required this.sessionManager, required this.sharedPreferences});

  @override
  bool get isUserLoading => _isUserLoading;

  @override
  bool get isFavoritesLoading => _isFavoritesLoading;

  @override
  String get userName => _userName ?? '';

  @override
  List<FavoriteMovieItemViewModelProtocol> get itemViewModels {
    return _favoritesMoviesList.map((movie) {
      return FavoriteMovieItemViewModel(
        movie: movie,
        delegate: this,
      );
    }).toList();
  }

  @override
  void didTapMovieDetails(Movie movie) {
    onTapMovieDetails?.call(movie);
  }

  @override
  void didTapRemoveFavorite(Movie movie) {
    sharedPreferences.deleteFavorite(movie).whenComplete(() {
      _favoritesMoviesList.removeWhere((element) {
        return element.id == movie.id;
      });
      notifyListeners();
    });
  }

  @override
  void loadContent() {
    sessionManager.verifySession();
    _getUsername();
    _getFavoriteMovies();
  }

  @override
  Future<void> didRefresh() async {
    loadContent();
  }

  void _getUsername() {
    _userName = sessionManager.user?.name;
    _setUserLoading(false);
  }

  Future<void> _getFavoriteMovies() async {
    _setFavoritesLoading(true);
    _favoritesMoviesList = await sharedPreferences.getFavorites().whenComplete(() {
      _setFavoritesLoading(false);
    });
  }

  void _setFavoritesLoading(bool isLoading) {
    _isFavoritesLoading = isLoading;
    notifyListeners();
  }

  void _setUserLoading(bool isLoading) {
    _isUserLoading = isLoading;
    notifyListeners();
  }
}
