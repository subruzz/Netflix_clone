import 'package:flutter/material.dart';
import 'package:netflix_clone/common/colors.dart';
import 'package:netflix_clone/common/utils.dart';

class ContinueWatchingTile extends StatelessWidget {
  const ContinueWatchingTile({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: continueWatching.length,
        itemBuilder: (ctx, index) => Container(
            width: 130,
            height: 100,
            padding: const EdgeInsets.all(6),
            child: Column(
              children: [
                Image.network(
                  width: 200,
                  height: 160,
                  fit: BoxFit.cover,
                  continueWatching[index],
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
