import '../../../../models/movie.dart';
import 'movie_carousel_item_view.dart';

class MovieCarouselItemViewModel extends MovieCarouselItemViewModelProtocol {
  final Movie movie;
  final int currentCard;
  final int indexCard;

  MovieCarouselItemViewModel({
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
}
