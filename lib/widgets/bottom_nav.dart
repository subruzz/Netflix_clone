import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/home.dart';
import 'package:netflix_clone/screens/more_screen.dart';
import 'package:netflix_clone/screens/new_hot.dart';
import 'package:netflix_clone/screens/search.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  final List<Widget> screens = const [
    HomePage(),
    SearchPage(),
    NewAndHotPage(),
    MoreScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int currentIndex) {
            setState(() {
              index = currentIndex;
            });
          },
          showSelectedLabels: true,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          currentIndex: index,
          enableFeedback: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_library), label: "New&hot"),

            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz_rounded), label: "More"),
          ],
        ),
        body: screens.elementAt(index));
  }
}
