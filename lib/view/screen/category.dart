import 'package:diplomatic_wallpaper/controller/apiOper.dart';
import 'package:diplomatic_wallpaper/model/photosModel.dart';
import 'package:diplomatic_wallpaper/view/screen/fullScreen.dart';
import 'package:diplomatic_wallpaper/view/widgets/CustomAppBar.dart';
import 'package:diplomatic_wallpaper/view/widgets/SearchBar.dart';
import 'package:diplomatic_wallpaper/view/widgets/catBlock.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  String catName;
  String catImgUrl;
  CategoryScreen({super.key, required this.catImgUrl, required this.catName});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late List<PhotosModel> categoryResults;
  bool isLoading = true;
  GetCatRelWall() async {
    categoryResults = await ApiOperations.searchWallpapers(widget.catName);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    GetCatRelWall();
    super.initState();
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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.network(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                          widget.catImgUrl),
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black38,
                      ),
                      Positioned(
                        left: 145,
                        top: 45,
                        child: Column(
                          children: [
                            Text(
                              widget.catName,
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 400,
                        crossAxisCount: 2,
                        crossAxisSpacing: 13,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: 16,
                      itemBuilder: (context, index) => GridTile(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FullScreen(
                                        imgUrl:
                                            categoryResults[index].imgSrc)));
                          },
                          child: Hero(
                            tag: categoryResults[index].imgSrc,
                            child: Container(
                              height: 500,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(20)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                    height: 500,
                                    width: 50,
                                    fit: BoxFit.cover,
                                    categoryResults[index].imgSrc),
                              ),
                            ),
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
