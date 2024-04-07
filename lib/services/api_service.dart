import 'dart:convert';

import 'package:netflix_clone/common/utils.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/models/tv_series_model.dart';

var key = '?api_key=$apiKey';
List<Movies> poplularMovies = [];
List<Movies> topRatedMovies = [];
List<Movies> upcomingMovies = [];
List<TvSeries> tvSeries = [];
List<Movies> searchItems = [];

class ApiServices {
  static Future<List<Movies>> getPopularMovies() async {
    final response = await http.get(Uri.parse('$baseUrl$popularEndPoint$key'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      List<dynamic> movieListData = responseData['results'];

      // Map each item in the movie list to a Movies object
      List<Movies> movies = movieListData.map((movieData) {
        return Movies.fromJson(movieData);
      }).toList();
      poplularMovies = movies;
      print(poplularMovies);
      return movies;
    } else {
      throw Exception('Error Loading Movies ');
    }
  }

  static Future<List<Movies>> getTopRated() async {
    final response = await http.get(Uri.parse('$baseUrl$topRatedEndPoint$key'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      List<dynamic> movieListData = responseData['results'];

      // Map each item in the movie list to a Movies object
      List<Movies> movies = movieListData.map((movieData) {
        return Movies.fromJson(movieData);
      }).toList();
      topRatedMovies = movies;

      return movies;
    } else {
      throw Exception('Error Loading Movies');
    }
  }

  static Future<List<Movies>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse('$baseUrl$upcomingEndpoint$key'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      List<dynamic> movieListData = responseData['results'];

      // Map each item in the movie list to a Movies object
      List<Movies> movies = movieListData.map((movieData) {
        return Movies.fromJson(movieData);
      }).toList();
      upcomingMovies = movies;
      return movies;
    } else {
      throw Exception('Error Loading Movies');
    }
  }

  static Future<List<TvSeries>> getTvSeries() async {
    final response = await http.get(Uri.parse('$baseUrl$tvSeriesEndPoint$key'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      List<dynamic> movieListData = responseData['results'];

      // Map each item in the movie list to a Movies object
      List<TvSeries> movies = movieListData.map((tvData) {
        return TvSeries.fromJson(tvData);
      }).toList();
      tvSeries = movies;
      return movies;
    } else {
      throw Exception('Error Loading Movies');
    }
  }

  static Future<List<Movies>> getSearchedItems(String enteredValue) async {
    final response = await http.get(Uri.parse(
        '$baseUrl$searchEndPoint$enteredValue${key.replaceAll('?', '&')}'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      List<dynamic> movieListData = responseData['results'];

      // Map each item in the movie list to a Movies object
      List<Movies> movies = movieListData.map((movieData) {
        return Movies.fromJson(movieData);
      }).toList();
      for (var i in movies) {
        for (var movie in movies) {
          print('Adult: ${movie.adult}');
          print('Backdrop Path: ${movie.backdropPath}');
          print('ID: ${movie.id}');
          print('Title: ${movie.title}');
          print('Original Language: ${movie.originalLanguage}');
          print('Original Title: ${movie.originalTitle}');
          print('Overview: ${movie.overview}');
          print('Poster Path: ${movie.posterPath}');
          print('Genre IDs: ${movie.genreIds}');
          print('Popularity: ${movie.popularity}');
          print('Release Date: ${movie.releaseDate}');
          print('Video: ${movie.video}');
          print('Vote Average: ${movie.voteAverage}');
          print('Vote Count: ${movie.voteCount}');
          print('--------------------');
        }
      }
      searchItems = movies;
      print(searchItems);

      return movies;
    } else {
      throw Exception('Error Loading Movies');
    }
  }
}
