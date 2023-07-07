import 'movie.dart';

class User {
  String name;
  List<Movie>? favorites;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'favorites': favorites,
    };
  }

  User.fromMap(Map map)
      : name = map['name'],
        favorites = map['favorites'];
}
