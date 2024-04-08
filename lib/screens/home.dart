import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/services/api_service.dart';
import 'package:netflix_clone/widgets/home_screen/carousal.dart';
import 'package:netflix_clone/widgets/home_screen/continue_watchile_tile.dart';
import 'package:netflix_clone/widgets/home_screen/movie_tile.dart';
import 'package:netflix_clone/widgets/home_screen/numbered_tile.dart';
import 'package:netflix_clone/widgets/common/sub_list_heading.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> continueWatching = [
    'https://images-cdn.ubuy.co.in/63ef0a397f1d781bea0a2464-star-wars-rogue-one-movie-poster.jpg',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/cream-white-film-poster-design-template-5261b394ee6c110057a857d40ede9fdd_screen.jpg?ts=1708101061',
    'https://m.media-amazon.com/images/I/71Jxq2p5YWL._AC_UF1000,1000_QL80_.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          width: 120,
        ),
        actions: [
          const Icon(
            Icons.cast,
            size: 30,
          ),
          const SizedBox(
            width: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(7.0),
            child: Image.network(
              'https://wallpapers.com/images/hd/netflix-profile-pictures-1000-x-1000-88wkdmjrorckekha.jpg',
              width: 30,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarousalItem(tvSeries: tvSeries),
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent, // Transparent at the top
                          Color.fromRGBO(
                              0, 0, 0, .7), // Black with opacity at the bottom
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Column(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Text(
                          'My List',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      onPressed: () {
                        ApiServices.getSearchedItems('ghost');
                      },
                      icon: const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.black,
                      ),
                      label: const Text(
                        'Play',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const Column(
                      children: [
                        Icon(
                          Icons.info,
                          color: Colors.white,
                        ),
                        Text(
                          'info',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const SubListHeading(
              fontSize: 20,
              title: 'Continue Watching',
            ),
            ContinueWatchingTile(
              continueWatcing: continueWatching,
            ),
            const SubListHeading(
              fontSize: 20,
              title: 'Top 10 In India',
            ),
            const NumbereredTile(),
            const SubListHeading(
              fontSize: 20,
              title: 'Popular',
            ),
            MovieTile(
              moviesList: poplularMovies,
            ),
            const SubListHeading(
              fontSize: 20,
              title: 'Top Rated',
            ),
            MovieTile(
              moviesList: topRatedMovies,
            ),
            const SubListHeading(
              fontSize: 20,
              title: 'Upcoming Movies',
            ),
            MovieTile(
              moviesList: upcomingMovies,
            )
          ],
        ),
      ),
    );
  }
}
