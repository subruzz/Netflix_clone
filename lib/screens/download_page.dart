import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/colors.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
        children: [
          Row(
            children: [
              Icon(
                Icons.settings,
                size: iconSize1,
                color: iconColor,
              ),
              mySizedBoxW,
              Text(
                'Smart Downloads',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w700),
              )
            ],
          ),
          mySizedBoxH,
          Text(
            'Introducing Downloads For You',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          mySizedBoxH,
          Text(
            textAlign: TextAlign.justify,
            'We\'ll download a personalised selection of movies and shows for you, so there\'s always something to watch on your device.',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.grey),
          ),
          mySizedBoxH,
          SizedBox(
            width: size.width,
            height: size.height / 2.7,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundColor: secColor,
                    radius: size.width * .5,
                  ),
                ),
                DownloadImagesContainer(
                  margin: const EdgeInsets.only(right: 150, bottom: 30),
                  size: size,
                  angle: -15,
                  image:
                      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/adventure-movie-poster-template-design-7b13ea2ab6f64c1ec9e1bb473f345547_screen.jpg?ts=1636999411',
                ),
                DownloadImagesContainer(
                  margin: const EdgeInsets.only(left: 150, bottom: 30),
                  size: size,
                  angle: 15,
                  image:
                      'https://www.movieposters.com/cdn/shop/products/108b520c55e3c9760f77a06110d6a73b_240x360_crop_center.progressive.jpg?v=1573652543',
                ),
                DownloadImagesContainer(
                  margin: const EdgeInsets.only(bottom: 20),
                  size: size,
                  angle: 0,
                  image:
                      'https://i.pinimg.com/236x/57/a5/01/57a5010a22a577ca1825669a144cc453.jpg',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(5.0), // Button border radius
                    ),
                  ),
                  onPressed: () {},
                  child: Text('SetUp',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black)),
                ),
              ),
              mySizedBoxH,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(5.0), // Button border radius
                  ),
                ),
                onPressed: () {},
                child: Text('See What You Can Download',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w700)),
              ),
            ],
          )
        ],
      
    );
  }
}

class DownloadImagesContainer extends StatelessWidget {
  const DownloadImagesContainer({
    required this.angle,
    required this.margin,
    required this.image,
    super.key,
    required this.size,
  });

  final Size size;
  final String image;
  final EdgeInsets margin;
  final double angle;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width * .36,
        height: size.height * .29,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}
