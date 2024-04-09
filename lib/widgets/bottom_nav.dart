import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/models/top_india.dart';
import 'package:netflix_clone/models/tv_series_model.dart';
import 'package:netflix_clone/screens/download_page.dart';
import 'package:netflix_clone/screens/home.dart';
import 'package:netflix_clone/screens/more_screen.dart';
import 'package:netflix_clone/screens/new_hot.dart';
import 'package:netflix_clone/screens/search.dart';
import 'package:netflix_clone/services/api_service.dart';
import 'package:netflix_clone/widgets/common/animated_container.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  late Future<List<Movies>> getTopRated;
  late Future<List<TopMovieIndia>> getMoviesIndia;
  late Future<List<Movies>> popular;
  late Future<List<Movies>> upcoming;
  late Future<List<TvSeries>> tvSeries;
  List<Widget> screens = [];

  @override
  void initState() {
    getTopRated = ApiServices.getTopRated();
    getMoviesIndia = ApiServices.getTopMoviesIndia();
    popular = ApiServices.getPopularMovies();
    upcoming = ApiServices.getUpcomingMovies();
    tvSeries = ApiServices.getTvSeries();
    // screens = [
    //   HomePage(
    //       getTopRated: getTopRated,
    //       getMoviesIndia: getMoviesIndia,
    //       popular: popular,
    //       upcoming: upcoming),
    //   const SearchPage(),
    //   const NewAndHotPage(),
    //   const DownloadPage(),
    //   const MoreScreen(),
    // ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget currentWidget = HomePage(
        tvSeries: tvSeries,
        getTopRated: getTopRated,
        getMoviesIndia: getMoviesIndia,
        popular: popular,
        upcoming: upcoming);
    if (index == 0) {
      currentWidget = HomePage(
          tvSeries: tvSeries,
          getTopRated: getTopRated,
          getMoviesIndia: getMoviesIndia,
          popular: popular,
          upcoming: upcoming);
    }
    if (index == 1) {
      currentWidget = SearchPage(
        popular: popular,
      );
    }
    if (index == 2) currentWidget = const NewAndHotPage();
    if (index == 3) currentWidget = const DownloadPage();
    if (index == 4) currentWidget = const MoreScreen();
    return Scaffold(
        appBar: index == 0 || index == 3
            ? AppBar(
                title: index == 3
                    ? Text(
                        'Downloads',
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    : Image.asset(
                        'assets/images/logo.png',
                        width: 120,
                      ),
                actions: const [
                  Icon(
                    Icons.cast,
                    size: 30,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  MyAnimatedContainer(
                      size: 35, selected: false, color: Colors.blue, name: ''),
                  SizedBox(
                    width: 15,
                  ),
                ],
              )
            : null,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int currentIndex) {
            setState(() {
              index = currentIndex;
            });
          },
          showSelectedLabels: true,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          currentIndex: index,
          enableFeedback: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_library), label: "New&hot"),
            BottomNavigationBarItem(
                icon: Icon(Icons.download), label: "Downloads"),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz_rounded), label: "More"),
          ],
        ),
        body: currentWidget);
  }
}
