import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';

class NumbereredTile extends StatelessWidget {
  const NumbereredTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (ctx, index) => Stack(
          children: [
            Container(
                margin: const EdgeInsets.only(left: 40),
                width: 130,
                height: 200,
                padding: const EdgeInsets.all(8),
                child: Image.network(
                  'https://rukminim2.flixcart.com/image/850/1000/jf8khow0/poster/a/u/h/small-hollywood-movie-poster-blade-runner-2049-ridley-scott-original-imaf3qvx88xenydd.jpeg?q=20&crop=false',
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
    );
  }
}
