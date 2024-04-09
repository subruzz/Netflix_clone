import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyShrimmer extends StatelessWidget {
  const MyShrimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade900.withOpacity(0.9),
      highlightColor: Colors.grey..shade800,
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount:
              10, // You can adjust this number based on your requirements
          itemBuilder: (context, index) {
            return SizedBox(
              width: 150, // Adjust the width based on your UI design
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                color: Colors.white, // Adjust the color based on your UI design
              ),
            );
          },
        ),
      ),
    );
  }
}
