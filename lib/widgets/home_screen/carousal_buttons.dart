import 'package:flutter/material.dart';

class CarousalButtons extends StatelessWidget {
  const CarousalButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Column(
          children: [
            Icon(
              Icons.add,
              color: Colors.white,
            ),
            Text(
              'My List',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            )
          ],
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          onPressed: () {},
          icon: const Icon(
            Icons.play_arrow_rounded,
            color: Colors.black,
          ),
          label: const Text(
            'Play',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        const Column(
          children: [
            Icon(
              Icons.info,
              color: Colors.white,
            ),
            Text(
              'info',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
