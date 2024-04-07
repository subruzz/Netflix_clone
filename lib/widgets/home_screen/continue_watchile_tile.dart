import 'package:flutter/material.dart';
import 'package:netflix_clone/common/colors.dart';

class ContinueWatchingTile extends StatelessWidget {
  const ContinueWatchingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (ctx, index) => Container(
            width: 130,
            height: 100,
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Image.network(
                  'https://rukminim2.flixcart.com/image/850/1000/jf8khow0/poster/a/u/h/small-hollywood-movie-poster-blade-runner-2049-ridley-scott-original-imaf3qvx88xenydd.jpeg?q=20&crop=false',
                ),
                const LinearProgressIndicator(
                  color: Colors.red,
                  value: .6,
                ),
                const ColoredBox(
                  color: secColor2,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.more_vert_rounded,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
