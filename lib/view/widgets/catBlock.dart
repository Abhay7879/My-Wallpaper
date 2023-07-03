import 'package:diplomatic_wallpaper/view/screen/category.dart';
import 'package:flutter/material.dart';

class CatBlock extends StatelessWidget {
  String categoryName;
  String categoryImgSrc;
  CatBlock(
      {super.key, required this.categoryImgSrc, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryScreen(
                    catImgUrl: categoryImgSrc, catName: categoryName)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                  height: 50, width: 100, fit: BoxFit.cover, categoryImgSrc),
            ),
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Positioned(
              left: 35,
              top: 15,
              child: Text(
                categoryName,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
