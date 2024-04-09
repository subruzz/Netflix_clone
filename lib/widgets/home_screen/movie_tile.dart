import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/screens/movie_details.dart';
import 'package:netflix_clone/services/api_service.dart';
import 'package:netflix_clone/widgets/common/shrimmer.dart';
import 'package:netflix_clone/widgets/common/sub_list_heading.dart';

class MovieTile extends StatelessWidget {
  const MovieTile(
      {super.key,
      required this.moviesList,
      required this.fetchMovies,
      required this.heading});
  final List<Movies> moviesList;
  final Future<List<Movies>> fetchMovies;
  final String heading;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchMovies,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MyShrimmer();
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
                'Sorry, we were not able to load $heading Movies, Please try again later.'),
          );
        }
        return SizedBox(
          height: 200,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (ctx, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => DetailsPage(
                              movie: snapshot.data![index],
                            )));
                  },
                  child: Container(
                      width: 130,
                      height: 100,
                      padding: const EdgeInsets.all(8),
                      child: Image.network(
                          '$imgeUrl${snapshot.data![index].posterPath}')),
                );
              }),
        );
      },
    );
  }
}
