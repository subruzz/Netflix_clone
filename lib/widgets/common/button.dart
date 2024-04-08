import 'package:flutter/material.dart';

class DetailsPageButton extends StatelessWidget {
  const DetailsPageButton(
      {super.key,
      required this.icon,
      required this.title,
      required this.btnColor,
      required this.color});
  final String title;
  final IconData icon;
  final Color color;
  final Color btnColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(10), backgroundColor: btnColor),
          onPressed: () {},
          icon: Icon(
            icon,
            size: 30,
            color: Colors.black,
          ),
          label: Text(
            title,
            style: TextStyle(
                color: color, fontWeight: FontWeight.w600, fontSize: 17),
          )),
    );
  }
}
