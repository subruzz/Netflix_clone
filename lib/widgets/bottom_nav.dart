import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/models/top_india.dart';
import 'package:netflix_clone/screens/download_page.dart';
import 'package:netflix_clone/screens/home.dart';
import 'package:netflix_clone/screens/more_screen.dart';
import 'package:netflix_clone/screens/new_hot.dart';
import 'package:netflix_clone/screens/search.dart';
import 'package:netflix_clone/services/api_service.dart';

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
  List<Widget> screens = [];
  @override
  void initState() {
    getTopRated = ApiServices.getTopRated();
    getMoviesIndia = ApiServices.getTopMoviesIndia();
    popular = ApiServices.getPopularMovies();
    upcoming = ApiServices.getUpcomingMovies();
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
        getTopRated: getTopRated,
        getMoviesIndia: getMoviesIndia,
        popular: popular,
        upcoming: upcoming);
    if (index == 0) {
      currentWidget = HomePage(
          getTopRated: getTopRated,
          getMoviesIndia: getMoviesIndia,
          popular: popular,
          upcoming: upcoming);
    }
    if (index == 1) currentWidget = const SearchPage();
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
