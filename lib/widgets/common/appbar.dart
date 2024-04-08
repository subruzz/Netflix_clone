import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        'assets/images/logo.png',
        width: 120,
      ),
      actions: [
        const Icon(
          Icons.cast,
          size: 30,
        ),
        const SizedBox(
          width: 15,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(7.0),
          child: Image.network(
            'https://wallpapers.com/images/hd/netflix-profile-pictures-1000-x-1000-88wkdmjrorckekha.jpg',
            width: 30,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
