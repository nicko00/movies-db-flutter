import '../setup/api_host.dart';
import '../setup/api_provider.dart';
import '../setup/endpoint.dart';

abstract class MoviesRoutesProtocol {
  void getMovies({required int page, required String moviesListUrl, Success? success, Failure? failure});
  void searchMovies({required int page, required String query, Success? success, Failure? failure});
}

class MoviesRoutes extends MoviesRoutesProtocol {
  final ApiProvider _provider = ApiProvider();

  @override
  void getMovies({
    required int page,
    required String moviesListUrl,
    Success? success,
    Failure? failure,
  }) {
    final endpoint = Endpoint(
      method: 'GET',
      path: moviesListUrl,
      queryParameters: {
        'page': '$page',
        'api_key': ApiHost.apiKey,
        'language': 'pt-BR',
        // 'include_adult': 'true',
      },
    );

    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }

  @override
  void searchMovies({required int page, required String query, Success? success, Failure? failure}) {
    final endpoint = Endpoint(
      method: 'GET',
      path: '/search/movie',
      queryParameters: {
        'page': '$page',
        'api_key': ApiHost.apiKey,
        'query': query,
        'language': 'pt-BR',
        // 'include_adult': 'true',
      },
    );

    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }
}
