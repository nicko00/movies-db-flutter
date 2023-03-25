import '../../../../api/routes/movies_routes.dart';
import '../../../../models/movie.dart';
import '../../../../support/utils/server_error.dart';

typedef Success = void Function(List<Movie> movies);
typedef Failure = void Function(ServerError error);

abstract class SearchMoviesUseCaseProtocol {
  void execute({required String query, Success? success, Failure? failure});
}

class SearchMoviesUseCase extends SearchMoviesUseCaseProtocol {
  final MoviesRoutesProtocol routes;

  SearchMoviesUseCase({required this.routes});

  @override
  void execute({required String query, Success? success, Failure? failure}) {
    routes.searchMovies(
      query: query,
      success: (response) {
        try {
          final movies = Movie.fromMaps(response['results']);
          success?.call(movies);
        } on Error catch (error) {
          failure?.call(error.internalError());
        }
      },
      failure: (dioError) {
        failure?.call(dioError.asServerError());
      },
    );
  }
}
