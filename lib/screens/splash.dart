import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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

    Future.wait([
      ApiServices.getPopularMovies(),
      ApiServices.getTopRated(),
      ApiServices.getUpcomingMovies(),
      ApiServices.getTopRated()
    ]).then((_) {
      // Wait for all API calls to complete before navigating to the next screen
      Future.delayed(const Duration(seconds: 3)).then((_) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const BottomNavBar()));
      });
    });
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
