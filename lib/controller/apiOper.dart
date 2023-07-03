import 'dart:convert';
import 'dart:math';

import 'package:diplomatic_wallpaper/model/categoryModel.dart';
import 'package:diplomatic_wallpaper/model/photosModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiOperations {
  static List<PhotosModel> trendingWallpapers = [];
  static List<PhotosModel> searchWallpapersList = [];
  static List<CategoryModel> categoryModelList = [];

  static Future<List<PhotosModel>> getTrendingWallpapers() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated"), headers: {
      "Authorization":
          "cHKcxEqSmtL1MTZefV0WFGGqWZ08QvE1eodpGQf9poWpQG7CwqZLIofd"
    }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData["photos"];
      photos.forEach((element) {
        trendingWallpapers.add(PhotosModel.fromAPI2App(element));
      });
    });
    return trendingWallpapers;
  }

  static Future<List<PhotosModel>> searchWallpapers(String query) async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
        headers: {
          "Authorization":
              "cHKcxEqSmtL1MTZefV0WFGGqWZ08QvE1eodpGQf9poWpQG7CwqZLIofd"
        }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData["photos"];
      searchWallpapersList.clear();
      photos.forEach((element) {
        searchWallpapersList.add(PhotosModel.fromAPI2App(element));
      });
    });
    return searchWallpapersList;
  }

  static List<CategoryModel> getCategoriesList() {
    List cateogryName = [
      "Cars",
      "Nature",
      "Bike",
      "City",
      "Flowers",
    ];
    categoryModelList.clear();
    cateogryName.forEach((catName) async {
      final _random = new Random();

      PhotosModel photoModel =
          (await searchWallpapers(catName))[0 + _random.nextInt(11 - 0)];
      print("IMG SRC IS HERE");
      print(photoModel.imgSrc);
      categoryModelList
          .add(CategoryModel(catImgUrl: photoModel.imgSrc, catName: catName));
    });

    return categoryModelList;
  }
}
