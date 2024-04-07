class TvSeries {
  bool adult;
  String backdropPath;
  int id;
  String title;
  String originalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  String mediaType;
  List<int> genreIds;
  double? popularity;
  DateTime releaseDate;

  double? voteAverage;
  int voteCount;

  TvSeries({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
   
    required this.voteAverage,
    required this.voteCount,
  });

  TvSeries.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        backdropPath = json['backdrop_path'],
        id = json['id'],
        title = json['name'],
        originalLanguage = json['original_language'],
        originalTitle = json['original_name'],
        overview = json['overview'],
        posterPath = json['poster_path'],
        mediaType = json['media_type'],
        genreIds = List<int>.from(json['genre_ids'] ?? []),
        popularity = json['popularity']?.toDouble(),
        releaseDate = DateTime.parse(json['first_air_date']),
       
        voteAverage = json['vote_average']?.toDouble(),
        voteCount = json['vote_count'];
}
