import 'package:flutter/material.dart';

class NewsAndHotitems extends StatelessWidget {
  const NewsAndHotitems({
    super.key,
    required this.imageUrl,
    required this.overview,
    required this.logoUrl,
    required this.month,
    required this.day,
  });
  final String imageUrl;
  final String overview;
  final String logoUrl;
  final String month;
  final String day;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  month,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                Text(day,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        letterSpacing: 5))
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(imageUrl,height: size.height/2.5,width: double.infinity,fit: BoxFit.fill,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width * 0.4,
                      height: size.width * 0.2,
                      child: Image.network(logoUrl),
                    ),
                    const Spacer(),
                    const Column(
                      children: [
                        Icon(
                          Icons.notifications_none_rounded,
                          size: 25,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Remind Me',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 8),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Column(
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          size: 25,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Info',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 8),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Coming on $month $day',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.5),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  overview,
                  textAlign: TextAlign.left,
                  maxLines: 3,
                  style: const TextStyle(color: Colors.grey, fontSize: 14.5),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
