import 'package:flutter/material.dart';

class MyAnimatedContainer extends StatelessWidget {
  const MyAnimatedContainer(
      {super.key,
      required this.selected,
      required this.size,
      required this.color,
      required this.name});
  final bool selected;
  final Color color;
  final String name;
  final double size;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        border:
            selected ? Border.all(width: 2, color: Colors.white) : Border.all(),
        color: color, // Your desired background color
        borderRadius: BorderRadius.circular(10),
      ),
      width: selected ? 96.0 : size,
      height: selected ? 92.0 : size,
      alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(name == 'Kids'
            ? 'assets/images/image.png'
            : 'assets/images/smiley.png'),
      ),
    );
  }
}
