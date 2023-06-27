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
    print('--> 26 $favorites');
    if (favorites == null) return [];

    print('--> 29 ${jsonDecode(favorites)}');

    return Movie.fromMaps(jsonDecode(favorites));
  }

  @override
  Future<bool> setFavorite(Movie favorite) async {
    final favorites = List<Movie>.empty(growable: true);
    final savedFavorites = await getFavorites();
    final favoritesList = List<Map<String, dynamic>>.empty(growable: true);

    print('--> 40 $savedFavorites');

    if (savedFavorites.isNotEmpty) {
      favorites.addAll(savedFavorites);
      print('--> 44 $favorites');
      favorites.add(favorite);
      print('--> 46 $favorites');
      for (final movie in favorites) {
        favoritesList.add(movie.toMap());
      }
      print('--> 48 $favoritesList');
    }

    return _sharedPreferences.setString('favorites_list', jsonEncode(favoritesList));
  }
}
