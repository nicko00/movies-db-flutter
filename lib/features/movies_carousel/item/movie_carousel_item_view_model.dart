import '../../../../models/movie.dart';
import 'movie_carousel_item_view.dart';

abstract class MovieCarouselItemViewModelDelegate {
  void didTapMovieDetails(Movie movie);
}

class MovieCarouselItemViewModel extends MovieCarouselItemViewModelProtocol {
  final Movie movie;
  final int currentCard;
  final int indexCard;
  final MovieCarouselItemViewModelDelegate delegate;

  MovieCarouselItemViewModel({
    required this.delegate,
    required this.movie,
    required this.currentCard,
    required this.indexCard,
  });

  @override
  String get title => movie.title;

  @override
  String get imageUrl => movie.posterUrl;

  @override
  double get cardScale => currentCard == indexCard ? 0 : 6;

  @override
  void didTapMovieItem() {
    delegate.didTapMovieDetails(movie);
  }
}
