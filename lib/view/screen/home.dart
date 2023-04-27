import 'package:diplomatic_wallpaper/controller/apiOper.dart';
import 'package:diplomatic_wallpaper/model/photosModel.dart';
import 'package:diplomatic_wallpaper/view/widgets/CustomAppBar.dart';
import 'package:diplomatic_wallpaper/view/widgets/SearchBar.dart';
import 'package:diplomatic_wallpaper/view/widgets/catBlock.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PhotosModel> trendingWallList = [];
  //bool isLoading = true;

  GetTrendingWallpapers() async {
    setState(() {
      //isLoading = false;
    });
    trendingWallList = await ApiOperations.getTrendingWallpapers();
  }

  @override
  void initState() {
    super.initState();
    ApiOperations.getTrendingWallpapers();
    GetTrendingWallpapers();
  }

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SearchBar(),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 30,
                  itemBuilder: (context, index) => CatBlock(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 647,
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 400,
                  crossAxisCount: 2,
                  crossAxisSpacing: 13,
                  mainAxisSpacing: 10,
                ),
                itemCount: trendingWallList.length,
                itemBuilder: (context, index) => Container(
                  height: 500,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      trendingWallList[index].imgSrc,
                      height: 500,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
