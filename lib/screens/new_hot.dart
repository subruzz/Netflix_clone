import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/new_and_hot_widgets/coming_soon.dart';
import 'package:netflix_clone/widgets/new_and_hot_widgets/eveyones_watching.dart';

class NewAndHotPage extends StatefulWidget {
  const NewAndHotPage({super.key});

  @override
  State<NewAndHotPage> createState() => _NewAndHotPageState();
}

class _NewAndHotPageState extends State<NewAndHotPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(
                color: Colors.white,
              ),
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
            bottom: const TabBar(
                unselectedLabelColor: Colors.white,
                unselectedLabelStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                labelColor: Colors.black,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(17)),
                    shape: BoxShape.rectangle,
                    color: Colors.white),
                tabs: [
                  Tab(
                    text: '   Coming Soon   🍿',
                  ),
                  Tab(
                    text: '🔥   Everyone\'s Watching   ',
                  )
                ]),
          ),
          body: const TabBarView(
            children: [ComingSoonPage(), EveryoneWatchingPage()],
          ),
        ),
      ),
    );
  }
}
