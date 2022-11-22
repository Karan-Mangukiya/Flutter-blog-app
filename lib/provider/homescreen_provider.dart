import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:blog_app/constants/Variables.dart';
import 'package:blog_app/model/auther.dart';
import 'package:blog_app/model/blog_entity.dart';
import 'package:blog_app/model/blog_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenProvider extends ChangeNotifier {
  List<bool> isFavourite = [false, false];
  List<int> countrlist = [0, 0];

  List<BlogDetailEntity> blogsList = <BlogDetailEntity>[];

  BlogImageEntity blogImage = BlogImageEntity();

  AutherEntity auther = AutherEntity();

  bool isBlogImageLoading = false;

  void selectedFavorite(int index) {
    if (isFavourite[index] == false) {
      isFavourite[index] = true;
      countrlist[index]++;
    } else {
      isFavourite[index] = false;
      if (countrlist[index] != 0) {
        countrlist[index]--;
      }
    }
    notifyListeners();
  }

  Future<List<BlogDetailEntity>> listOfBlogs() async {
    try {
      const url = "$baseUrl/wp/v2/posts";

      SharedPreferences pref = await SharedPreferences.getInstance();
      var authToken = pref.getString('authtoken');
      final response = await http.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $authToken",
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );
      final List<dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        blogsList = List<BlogDetailEntity>.from(responseData
            .map<dynamic>((e) => BlogDetailEntity.fromMap(e))
            .toList());
      }

      return <BlogDetailEntity>[];
    } catch (e) {
      log("error message ${e.toString()}");

      return <BlogDetailEntity>[];
    }
  }

  Future<BlogImageEntity> imagesOfBlog(int index) async {
    isBlogImageLoading = true;
    var id = blogsList[index].featuredMedia;

    try {
      final url = "$baseUrl/wp/v2/media/$id";

      SharedPreferences pref = await SharedPreferences.getInstance();
      var authToken = pref.getString('authtoken');

      final response = await http.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $authToken",
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        blogImage = BlogImageEntity.fromMap(responseData);
        // log("blogImage::$blogImage");
      }

      isBlogImageLoading = false;
      notifyListeners();

      return BlogImageEntity();
    } catch (e) {
      log("blog image error message ${e.toString()}");
      return BlogImageEntity();
    }
  }

  Future<AutherEntity> autherData(int autherId) async {
    try {
      final url = "$baseUrl/wp/v2/users/$autherId";

      SharedPreferences pref = await SharedPreferences.getInstance();
      var authToken = pref.getString('authtoken');

      final response = await http.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $authToken",
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );

      final Map<String, dynamic> responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        auther = AutherEntity.fromMap(responseData);
      }

      return AutherEntity();
    } catch (e) {
      log("autherdata error message ${e.toString()}");
      return AutherEntity();
    }
  }
}
