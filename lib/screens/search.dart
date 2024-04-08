import 'dart:async';

import 'package:flutter/material.dart';

import 'package:netflix_clone/common/colors.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/services/api_service.dart';
import 'package:netflix_clone/widgets/search_screen/search_item.dart';
import 'package:netflix_clone/widgets/common/sub_list_heading.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Timer? _debounce;
  String searchQuery = '';

  List<Movies> searchedItems = [];
  void searchMovies() {
    // Cancel any previous Timer
    if (_debounce != null) {
      _debounce!.cancel();
    }

    // Schedule a new Timer
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ApiServices.getSearchedItems(searchQuery).then((value) {
        setState(() {
          searchedItems = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextField(
          onChanged: (String value) async {
            searchQuery = value;
            searchMovies();
          },
          decoration: InputDecoration(
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
            hintStyle: const TextStyle(color: Colors.white),
            hintText: "Search movies, shows, tv...",
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
        if (searchQuery.isEmpty)
          const SubListHeading(
            fontSize: 28,
            title: 'Popular Searches',
          ),
        const SizedBox(
          height: 20,
        ),
        searchQuery.isEmpty
            ? Expanded(
                child: ListView.builder(
                    itemCount: poplularMovies.length,
                    itemBuilder: (ctx, index) => SearchItem(
                          movie: poplularMovies[index],
                        )),
              )
            : searchedItems.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        itemCount: searchedItems.length,
                        itemBuilder: (ctx, index) => SearchItem(
                              movie: searchedItems[index],
                            )),
                  )
                : const Expanded(
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Oops.We haven't got that.",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Try searching for another movies",
                              style: TextStyle(color: Colors.grey),
                            )
                          ]),
                    ),
                  )
      ]),
    );
  }
}
