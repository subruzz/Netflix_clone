

class TopMovieIndia {
  int rank;
  String title;
  String director;
  int year;
  List<String> genre;
  String posterUrl;
  double imdbRating;
  String overview;
  String releaseDate;

  TopMovieIndia({
    required this.rank,
    required this.title,
    required this.director,
    required this.year,
    required this.genre,
    required this.posterUrl,
    required this.imdbRating,
    required this.overview,
    required this.releaseDate,
  });

  TopMovieIndia.fromJson(Map<String, dynamic> json)
      : rank = json['rank'],
        title = json['title'],
        director = json['director'],
        year = json['year'],
        genre = List<String>.from(json['genre']),
        posterUrl = json['posterUrl'],
        imdbRating = json['imdbRating'].toDouble(),
        overview = json['overview'],
        releaseDate = json['releaseDate'];
}
