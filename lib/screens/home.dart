import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/models/top_india.dart';
import 'package:netflix_clone/services/api_service.dart';
import 'package:netflix_clone/widgets/home_screen/continue_watchile_tile.dart';
import 'package:netflix_clone/widgets/home_screen/movie_tile.dart';
import 'package:netflix_clone/widgets/home_screen/numbered_tile.dart';
import 'package:netflix_clone/widgets/common/sub_list_heading.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(false);

class HomePage extends StatelessWidget {
  const HomePage(
      {super.key,
      required this.getTopRated,
      required this.getMoviesIndia,
      required this.popular,
      required this.upcoming});
  final Future<List<Movies>> getTopRated;
  final Future<List<TopMovieIndia>> getMoviesIndia;
  final Future<List<Movies>> popular;
  final Future<List<Movies>> upcoming;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const CarousalContainer(),
          const SizedBox(
            height: 20,
          ),
          const SubListHeading(
            fontSize: 20,
            title: 'Continue Watching',
          ),
          ContinueWatchingTile(
          ),
          const SubListHeading(
            fontSize: 20,
            title: 'Top 10 In India',
          ),
          NumbereredTile(topMovieIndia: getMoviesIndia),
          const SubListHeading(
            fontSize: 20,
            title: 'Popular',
          ),
          MovieTile(
            fetchMovies: popular,
            moviesList: poplularMovies,
            heading: 'Popular',
          ),
          const SubListHeading(
            fontSize: 20,
            title: 'Top Rated',
          ),
          MovieTile(
            heading: 'Top Rated',
            fetchMovies: getTopRated,
            moviesList: topRatedMovies,
          ),

          const SubListHeading(
            fontSize: 20,
            title: 'Upcoming Movies',
          ),
          MovieTile(
            heading: 'Upcoming Movies',
            fetchMovies: upcoming,
            moviesList: upcomingMovies,
          )
        ],
      ),
    );
  }
}
