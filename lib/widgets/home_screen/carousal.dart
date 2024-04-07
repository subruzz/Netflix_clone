import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/tv_series_model.dart';

class CarousalItem extends StatelessWidget {
  const CarousalItem({super.key, required this.tvSeries});
  final List<TvSeries> tvSeries;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: tvSeries.length,
        itemBuilder: (ctx, index, realIdx) => Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        NetworkImage('$imgeUrl${tvSeries[index].posterPath}')),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent, // Transparent at the top
                    Color.fromRGBO(
                        0, 0, 0, 0.7), // Black with opacity at the bottom
                  ],
                ),
              ),
            ),
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height / 2.1,
          aspectRatio: 16 / 5,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 6),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: null,
          scrollDirection: Axis.horizontal,
        ));
  }
}
