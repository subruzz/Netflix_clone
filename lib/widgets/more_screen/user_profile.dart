import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/common/animated_container.dart';

class UserProfileItem extends StatefulWidget {
  const UserProfileItem(
      {super.key, required this.color, required this.name, this.screenChange});
  final String name;
  final Color color;
  final Function? screenChange;
  @override
  State<UserProfileItem> createState() => _UserProfileItemState();
}

class _UserProfileItemState extends State<UserProfileItem> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (widget.screenChange != null) {
                widget.screenChange!();
              }
              setState(() {
                selected = !selected;
              });
            },
            child: Center(
                child: MyAnimatedContainer(
              size: 89,
              color: widget.color,
              name: widget.name,
              selected: selected,
            )),
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
