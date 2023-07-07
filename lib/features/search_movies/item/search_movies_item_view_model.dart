import '../../../../models/movie.dart';
import 'search_movies_item_view.dart';

abstract class SearchMoviesItemViewModelDelegate {
  void didTapMovieDetails(Movie movie);
}

class SearchMoviesItemViewModel extends SearchMoviesItemViewModelProtocol {
  final Movie movie;
  final SearchMoviesItemViewModelDelegate delegate;

  SearchMoviesItemViewModel({required this.delegate, required this.movie});

  @override
  String get title => movie.title;

  @override
  String get imageUrl => movie.posterUrl;

  @override
  void didTapMovieItem() {
    delegate.didTapMovieDetails(movie);
  }
}
