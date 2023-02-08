import '../../../api/routes/movies_routes.dart';
import '../../../models/movie.dart';
import '../../../support/utils/server_error.dart';

typedef Success = void Function(List<Movie> movies);
typedef Failure = void Function(ServerError error);

abstract class GetMoviesUseCaseProtocol {
  void execute({Success? success, Failure? failure});
}

class GetMoviesUseCase extends GetMoviesUseCaseProtocol {
  final MoviesRoutes routes;
  final String moviesPath;

  GetMoviesUseCase({required this.routes, required this.moviesPath});

  @override
  void execute({Success? success, Failure? failure}) {
    routes.getMovies(
      moviesListUrl: moviesPath,
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
