import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:blog_app/constants/Variables.dart';
import 'package:blog_app/model/comment_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class commentScreenProvider with ChangeNotifier {
  List<CommentEntity> commentList = [];

  Future<List<CommentEntity>> fatchComment(int id, context,
      {int perPage = 20}) async {
    // isLoading = true;
    try {
      final url = "$baseUrl/$addCommentEndpoint?post=$id&per_page=$perPage";

      log(url);

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
      log(response.body);

      if (response.statusCode == 200) {
        commentList = List<CommentEntity>.from(responseData
            .map<dynamic>((e) => CommentEntity.fromMap(e))
            .toList());

        // Navigator.pushNamed(
        //   context,
        //   '/comment',
        // );
        log("instance of blog::$commentList");
      }

      return <CommentEntity>[];
    } catch (e) {
      log("fetching comment error::$e");
      return <CommentEntity>[];
    }
  }
}
