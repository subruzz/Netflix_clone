import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:netflix_clone/models/top_india.dart';
import 'package:netflix_clone/screens/movie_details.dart';
import 'package:netflix_clone/widgets/common/shrimmer.dart';
import 'package:netflix_clone/widgets/common/sub_list_heading.dart';
import 'package:shimmer/shimmer.dart';

class NumbereredTile extends StatelessWidget {
  const NumbereredTile({super.key, required this.topMovieIndia});
  final Future<List<TopMovieIndia>> topMovieIndia;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: topMovieIndia,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const  MyShrimmer();
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
                'Error Fetching Top 10 Movies'),
          );
        } else {
          return SizedBox(
            height: 200,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (ctx, index) {
                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (ctx, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => DetailsPage(
                                      topIndia: snapshot.data![index])));
                        },
                        child: Stack(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(left: 40),
                                width: 130,
                                height: 200,
                                padding: const EdgeInsets.all(8),
                                child: Image.network(
                                  snapshot.data![index].posterUrl,
                                )),
                            Positioned(
                              bottom: 50,
                              left: 20,
                              child: BorderedText(
                                strokeWidth: 3,
                                strokeColor: Colors.white,
                                child: Text(
                                  "${index + 1}",
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    decoration: TextDecoration.none,
                                    fontSize: 90,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        }
      },
    );
  }
}
