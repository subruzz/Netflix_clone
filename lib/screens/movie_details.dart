import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/colors.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/widgets/common/button.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.movie});
  final Movies movie;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            height: screenSize.height / 2.7,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('$imgeUrl${movie.posterPath}')),
            ),
            child: SafeArea(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            movie.title,
            textAlign: TextAlign.left,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(movie.releaseDate.split('-').first),
              const SizedBox(
                width: 15,
              ),
              ColoredBox(
                  color: secColor,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(movie.popularity.toStringAsFixed(1)),
                  )),
              const SizedBox(
                width: 15,
              ),
              Text(movie.voteAverage.toStringAsFixed(2)),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const DetailsPageButton(
            color: Colors.black,
            icon: Icons.play_arrow_rounded,
            btnColor: Colors.white,
            title: 'play',
          ),
          const SizedBox(
            height: 15,
          ),
          const DetailsPageButton(
            btnColor: Colors.grey,
            color: Colors.white,
            icon: Icons.file_download_rounded,
            title: 'Download',
          ),
          Text(movie.overview),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              Icon(
                Icons.thumb_up_sharp,
                color: Colors.white,
              ),
              Icon(
                Icons.share,
                color: Colors.white,
              )
            ],
          )
        ],
      ),
    );
  }
}
