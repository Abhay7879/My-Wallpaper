import 'package:diplomatic_wallpaper/view/widgets/CustomAppBar.dart';
import 'package:diplomatic_wallpaper/view/widgets/SearchBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: CustomAppBar(word1: "Diplomatic", word2: "Wallpaper"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SearchBar(),
          ),
        ],
      ),
    );
  }
}
