import 'package:flutter/material.dart';
import 'package:netflix_clone/common/colors.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/top_india.dart';
import 'package:netflix_clone/services/api_service.dart';
import 'package:netflix_clone/widgets/common/button.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, this.movie, this.topIndia});

  final Movies? movie;
  final TopMovieIndia? topIndia;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: screenSize.height / 2.7,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(movie != null
                          ? '$imgeUrl${movie!.posterPath}'
                          : topIndia!.posterUrl)),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 15),
                Text(
                  movie != null ? movie!.title : topIndia!.title,
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text(movie != null
                        ? movie!.releaseDate.split('-').first
                        : topIndia!.releaseDate.split(',').last),
                    const SizedBox(width: 15),
                    ColoredBox(
                      color: secColor,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                            '${movie != null ? movie!.voteAverage.toStringAsFixed(2) : topIndia!.imdbRating} ⭐'),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(movie != null
                        ? movie!.adult
                            ? '18+'
                            : ''
                        : topIndia!.rank.toString()),
                  ],
                ),
                const SizedBox(height: 15),
                const DetailsPageButton(
                  color: Colors.black,
                  icon: Icons.play_arrow_rounded,
                  btnColor: Colors.white,
                  title: 'play',
                ),
                const SizedBox(height: 15),
                const DetailsPageButton(
                  btnColor: Colors.grey,
                  color: Colors.white,
                  icon: Icons.file_download_rounded,
                  title: 'Download',
                ),
                const SizedBox(height: 15),
                Text(
                  movie != null ? movie!.overview : topIndia!.overview,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
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
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Related Movies',
                  style: TextStyle(fontSize: 24),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: poplularMovies.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 15.0,
                    childAspectRatio: .8,
                  ),
                  itemBuilder: (context, index) => Image.network(
                    '$imgeUrl${poplularMovies[index].posterPath}',
                    width: 200,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
