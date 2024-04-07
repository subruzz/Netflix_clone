import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/colors.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/services/api_service.dart';
import 'package:netflix_clone/widgets/search_screen/search_item.dart';
import 'package:netflix_clone/widgets/sub_list_heading.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Movies> searchedItems = [];
  void searchMovies(String searchQuery) async {
    ApiServices.getSearchedItems(searchQuery).then((value) {
      setState(() {
        searchedItems = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (String value) async {
              searchMovies(value);
            },
            decoration: InputDecoration(
              label: Text(
                'Search for movies,shows etc..',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 19),
              ),
              filled: true,
              fillColor: secColor,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              suffixIcon: const Icon(
                Icons.mic_none_sharp,
                color: Colors.white,
              ),
              contentPadding: const EdgeInsets.all(12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SubListHeading(
            fontSize: 28,
            title: 'Popular Searches',
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: searchedItems.length,
                itemBuilder: (ctx, index) => SearchItem(
                      movie: searchedItems[index],
                    )),
          )
        ],
      ),
    );
  }
}
