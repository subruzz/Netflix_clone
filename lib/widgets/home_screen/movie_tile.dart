import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/services/api_service.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({super.key, required this.moviesList});
  final List<Movies> moviesList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: moviesList.length,
          itemBuilder: (ctx, index) {
            return Container(
                width: 130,
                height: 100,
                padding: const EdgeInsets.all(8),
                child: Image.network(
                    '$imgeUrl${moviesList[index].posterPath}'));
          }),
    );
  }
}
