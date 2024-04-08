import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/models/tv_series_model.dart';
import 'package:netflix_clone/services/api_service.dart';

import 'package:netflix_clone/widgets/bottom_nav.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    getData().then((_) {
      Future.delayed(const Duration(seconds: 3)).then((_) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const BottomNavBar()));
    });
    });
    
  }

  Future<void> getData() async {
    poplularMovies = await ApiServices.getPopularMovies();
    topRatedMovies = await ApiServices.getTopRated();
    tvSeries = await ApiServices.getTvSeries();
    upcomingMovies = await ApiServices.getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/images/netflix.json'),
      ),
    );
  }
}
