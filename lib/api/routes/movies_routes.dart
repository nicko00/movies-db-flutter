import '../setup/api_host.dart';
import '../setup/api_provider.dart';
import '../setup/endpoint.dart';

abstract class MoviesRoutesProtocol {
  void getMovies({required String moviesListUrl, Success? success, Failure? failure});
}

class MoviesRoutes extends MoviesRoutesProtocol {
  final ApiProvider _provider = ApiProvider();

  @override
  void getMovies({required String moviesListUrl, Success? success, Failure? failure}) {
    final endpoint = Endpoint(
      method: 'GET',
      path: moviesListUrl,
      queryParameters: {'api_key': ApiHost.apiKey, 'language': 'pt-BR'},
    );

    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }
}
