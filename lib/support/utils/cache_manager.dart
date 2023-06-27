import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/movie.dart';

abstract class CacheManagerProtocol {
  Future<void> initialize();
  Future<List<Movie>> getFavorites();
  Future<bool> setFavorite(Movie favorite);
}

class CacheManager extends CacheManagerProtocol {
  CacheManager._();
  late SharedPreferences _sharedPreferences;

  static final instance = CacheManager._();

  @override
  Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future<List<Movie>> getFavorites() async {
    final favorites = _sharedPreferences.getString('favorites_list');
    if (favorites == null) return [];

    return Movie.fromMaps(jsonDecode(favorites));
  }

  @override
  Future<bool> setFavorite(Movie favorite) async {
    final favorites = List<Movie>.empty(growable: true);
    final savedFavorites = await getFavorites();
    final favoritesList = List<Map<String, dynamic>>.empty(growable: true);

    if (savedFavorites.isNotEmpty) {
      favorites.addAll(savedFavorites);
      favorites.add(favorite);
      for (final movie in favorites) {
        favoritesList.add(movie.toMap());
      }
    }

    return _sharedPreferences.setString('favorites_list', jsonEncode(favoritesList));
  }
}
