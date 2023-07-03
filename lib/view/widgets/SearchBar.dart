import 'package:diplomatic_wallpaper/view/screen/search.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  SearchBar({super.key});

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.black12,
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              onSubmitted: (value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SearchScreen(query: _searchController.text),
                  ),
                );
              },
              decoration: InputDecoration(
                hintText: "Search Wallpaper",
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SearchScreen(query: _searchController.text)));
            },
            child: Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
