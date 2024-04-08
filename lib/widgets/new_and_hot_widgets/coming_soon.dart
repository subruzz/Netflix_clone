import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/new_and_hot_widgets/movie_items.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          NewsAndHotitems(
            imageUrl:
                'https://miro.medium.com/v2/resize:fit:1024/1*P_YU8dGinbCy6GHlgq5OQA.jpeg',
            overview:
                'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
            logoUrl:
                "https://s3.amazonaws.com/www-inside-design/uploads/2017/10/strangerthings_feature-983x740.jpg",
            month: "Jun",
            day: "19",
          ),
          SizedBox(
            height: 20,
          ),
          NewsAndHotitems(
            imageUrl: 'https://www.pinkvilla.com/images/2022-09/rrr-review.jpg',
            overview:
                'A fearless revolutionary and an officer in the British force, who once shared a deep bond, decide to join forces and chart out an inspirational path of freedom against the despotic rulers.',
            logoUrl:
                "https://www.careerguide.com/career/wp-content/uploads/2023/10/RRR_full_form-1024x576.jpg",
            month: "Mar",
            day: "07",
          ),
          NewsAndHotitems(
            imageUrl:
                'https://i.pinimg.com/236x/51/24/d1/5124d1d3cd2d6513448fe45e65aca8d3.jpg',
            overview:
                'On their flight from New York to London, Hadley and Oliver fall in love with each other. However, they lose each other at customs and the possibility of ever meeting each other again seems improbable, but destiny may have a way of changing the odds.',
            logoUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQv1EHM-kv1FVIhKykTKbIL2knOR2xnp69AX55rXZLc9Q&s",
            month: "Feb",
            day: "20",
          ),
        ],
      ),
    );
  }
}
