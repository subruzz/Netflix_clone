import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/colors.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_model.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.movie});
  final Movies movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: secColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                movie.posterPath.isNotEmpty?
                Image.network(
                    width: 130,
                    fit: BoxFit.cover,
                    height: 70,
                    '$imgeUrl${movie.posterPath}'):const SizedBox(),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    movie.title,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.play_circle_outline_outlined,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
