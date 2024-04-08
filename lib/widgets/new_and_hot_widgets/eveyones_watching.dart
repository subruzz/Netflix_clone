import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/new_and_hot_widgets/movie_items.dart';

class EveryoneWatchingPage extends StatelessWidget {
  const EveryoneWatchingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          NewsAndHotitems(
            imageUrl:
                'https://www.tallengestore.com/cdn/shop/products/PeakyBlinders-ThomasShelby-GarrisonBombing-NetflixTVShow-ArtPoster_7fef60c1-eddd-41e8-89fd-ac6edeba5038.jpg?v=1619864662',
            overview:
                'Peaky Blinders is a crime drama centred on a family of mixed Irish Traveller and Romani origins based in Birmingham, England, starting in 1919, several months after the end of the First World War',
            logoUrl:
                "https://upload.wikimedia.org/wikipedia/en/e/e8/Peaky_Blinders_titlecard.jpg",
            month: "Apr",
            day: "16",
          ),
          NewsAndHotitems(
            imageUrl:
                'https://www.tallengestore.com/cdn/shop/products/QGM6_1_2e47f50e-babd-478a-bdfa-68eb13d35d0f.jpg?v=1623075168',
            overview:
                'Anya Taylor-Joy as Beth Harmon, an orphan who matures into a competitive young adult fueled by a desire to become the greatest chess player in the world while masking a growing addiction to the drugs and alcohol that allow her to function.',
            logoUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQve3Rz6SCAndIekHaN8w5Cxm9i4AKNZVb4N3U-e5RqQ&s",
            month: "Jul",
            day: "05",
          ),
        ],
      ),
    );
  }
}
