import '../../../models/movie.dart';
import 'favorite_movie_item_view.dart';

abstract class FavoriteMovieItemViewModelDelegate {
  void didTapMovieDetails(Movie movie);
  void didTapRemoveFavorite(Movie movie);
}

class FavoriteMovieItemViewModel extends FavoriteMovieItemViewModelProtocol {
  final Movie movie;
  final FavoriteMovieItemViewModelDelegate delegate;

  FavoriteMovieItemViewModel({required this.movie, required this.delegate});

  @override
  String get title => movie.title;

  @override
  String get imageUrl => movie.posterUrl;

  @override
  void didTapMovieItem() {
    delegate.didTapMovieDetails(movie);
  }

  @override
  void didTapFavorite() {
    delegate.didTapRemoveFavorite(movie);
  }
}
