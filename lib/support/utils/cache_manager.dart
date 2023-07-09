import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/movie.dart';
import 'constants.dart';

abstract class CacheManagerProtocol {
  Future<void> initialize();
  Future<bool> setBool({required String key, required bool value});
  bool getBool(String key);
  Future<List<Movie>> getFavorites();
  Future<bool> setFavorite(Movie movie);
  Future<bool> deleteFavorite(Movie movie);
}

class CacheManager extends CacheManagerProtocol {
  late SharedPreferences _sharedPreferences;

  CacheManager._();

  static final instance = CacheManager._();

  @override
  Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Set values
  @override
  Future<bool> setBool({required String key, required bool value}) async {
    return await _sharedPreferences.setBool(key, value);
  }

  @override
  bool getBool(String key) {
    return _sharedPreferences.getBool(key) ?? false;
  }

  /// Favorites
  @override
  Future<List<Movie>> getFavorites() async {
    final favorites = _sharedPreferences.getString(
      Constants.preferencesFavoritesListKey,
    );
    if (favorites == null) return [];

    return Movie.fromMaps(jsonDecode(favorites));
  }

  @override
  Future<bool> setFavorite(Movie movie) async {
    final favorites = List<Movie>.empty(growable: true);
    final savedFavorites = await getFavorites();
    final favoritesList = List<Map<String, dynamic>>.empty(growable: true);

    favorites.add(movie);

    if (savedFavorites.isNotEmpty) favorites.addAll(savedFavorites);

    for (final movie in favorites) {
      favoritesList.add(movie.toMap());
    }

    return _sharedPreferences.setString(
      Constants.preferencesFavoritesListKey,
      jsonEncode(favoritesList),
    );
  }

  @override
  Future<bool> deleteFavorite(Movie movie) async {
    final favorites = await getFavorites();
    final stringifiedFavorites = List<Map<String, dynamic>>.empty(growable: true);
    final favoriteToDelete = favorites.where((favoriteMovie) {
      return favoriteMovie.id == movie.id;
    }).first;
    favorites.remove(favoriteToDelete);
    for (final movie in favorites) {
      stringifiedFavorites.add(movie.toMap());
    }

    return _sharedPreferences.setString(
      Constants.preferencesFavoritesListKey,
      jsonEncode(stringifiedFavorites),
    );
  }
}
