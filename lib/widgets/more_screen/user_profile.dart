import 'package:flutter/material.dart';

class UserProfileItem extends StatefulWidget {
  const UserProfileItem({super.key, required this.color, required this.name});
  final String name;
  final Color color;

  @override
  State<UserProfileItem> createState() => _UserProfileItemState();
}

class _UserProfileItemState extends State<UserProfileItem> {
  bool selected = false ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: Center(
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  border: selected
                      ? Border.all(width: 2, color: Colors.white)
                      : Border.all(),
                  color: widget.color, // Your desired background color
                  borderRadius: BorderRadius.circular(10),
                ),
                width: selected ? 96.0 : 90.0,
                height: selected ? 92.0 : 90.0,
                alignment: selected
                    ? Alignment.center
                    : AlignmentDirectional.topCenter,
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(widget.name == 'Kids'
                      ? 'assets/images/image.png'
                      : 'assets/images/smiley.png'),
                ),
              ),
            ),
          ),
          Text(
            widget.name,
            style: const TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
