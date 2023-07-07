import '../api/setup/api_host.dart';

class Movie {
  final int id;
  final String title;
  final String description;
  final String releaseDate;
  final num rating;
  final String? _posterPath;

  String get posterUrl => '${ApiHost.baseImagesUrl}$_posterPath';

  Movie.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        description = map['overview'] ?? '',
        _posterPath = map['poster_path'],
        releaseDate = map['release_date'],
        rating = map['vote_average'];

  static List<Movie> fromMaps(List<dynamic> maps) {
    return maps.map((extract) {
      return Movie.fromMap(extract);
    }).toList();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'overview': description,
      'poster_path': _posterPath,
      'release_date': releaseDate,
      'vote_average': rating,
    };
  }
}
