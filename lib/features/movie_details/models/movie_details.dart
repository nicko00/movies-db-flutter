import '../../../models/movie.dart';

class MovieDetails {
  final Movie movie;
  final bool? isFromDb;

  MovieDetails({required this.movie, this.isFromDb});
}
