import 'package:flutter/material.dart';
import 'package:netflix_clone/services/api_service.dart';
import 'package:netflix_clone/widgets/home_screen/carousal.dart';
import 'package:netflix_clone/widgets/home_screen/carousal_buttons.dart';

class CarousalContainer extends StatelessWidget {
  const CarousalContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        const CarousalButtons()
      ],
    );
  }
}
