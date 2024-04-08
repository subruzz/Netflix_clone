import 'package:flutter/material.dart';

class SubListHeading extends StatelessWidget {
  const SubListHeading(
      {super.key, required this.fontSize, required this.title});
  final double fontSize;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontWeight: FontWeight.bold, fontSize: fontSize),
    );
  }
}
