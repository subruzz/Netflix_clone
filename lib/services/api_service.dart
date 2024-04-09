import 'dart:convert';

import 'package:netflix_clone/common/utils.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/models/top_india.dart';
import 'package:netflix_clone/models/tv_series_model.dart';

var key = '?api_key=$apiKey';
List<Movies> poplularMovies = [];
List<Movies> topRatedMovies = [];
List<Movies> upcomingMovies = [];
List<TvSeries> tvSeries = [];
List<Movies> searchItems = [];
List<TopMovieIndia> topMmoviesIndia = [];

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
      searchItems = movies;
      return movies;
    } else {
      throw Exception('Error Loading Movies');
    }
  }

  static Future<List<TopMovieIndia>> getTopMoviesIndia() async {
    final response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/ff142978-a13a-42ab-9555-3682696f00ac'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      List<dynamic> movieListData = responseData['topMovies'];

      // Map each item in the movie list to a Movies object
      List<TopMovieIndia> movies = movieListData.map((movieData) {
        return TopMovieIndia.fromJson(movieData);
      }).toList();
      topMmoviesIndia = movies;
      return topMmoviesIndia;
    } else {
      throw Exception('Error Loading Movies');
    }
  }
}
