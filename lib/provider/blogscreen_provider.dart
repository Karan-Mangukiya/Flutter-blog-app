import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:blog_app/Utils.dart';
import 'package:blog_app/constants/Variables.dart';
import 'package:blog_app/model/comment_entity.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BlogDetailScreenProvider extends ChangeNotifier {
  int currentPosition = 0;

  String? comment;
  List<CommentEntity> commentList = [];

  void updatePosition(int position) {
    currentPosition = position;
    notifyListeners();
  }

  Future<void> addComment(
    int autherId,
    String autherName,
    int blogId,
    context,
  ) async {
    EasyLoading.show(status: 'loading...');

    try {
      const url = "$baseUrl/$addCommentEndpoint";

      Map<String, dynamic> commentData = <String, dynamic>{
        'author': autherId,
        'author_name': autherName,
        'content': commentController.text.trim(),
        'post': blogId,
      };

      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString("authtoken");

      final response = await http.post(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: json.encode(commentData),
      );

      final Map<String, dynamic> createCommentData = json.decode(response.body);

      if (response.statusCode == 201) {
        log(createCommentData.toString());
        commentController.clear();
        comment = createCommentData['content']['rendered'];
        fatchComment(blogId, context);

        showSnackBar('Comment added successfully!', context);
      }

      if (createCommentData['code'] == 'comment_duplicate') {
        showSnackBar(createCommentData['message'], context);
      }
      EasyLoading.dismiss();
    } catch (e) {
      log("comment error message :: $e");
    }
  }

  Future<List<CommentEntity>> fatchComment(int id, context,
      {int perPage = 20}) async {
    EasyLoading.show(status: 'loading...');
    try {
      final url = "$baseUrl/$addCommentEndpoint?post=$id&per_page=$perPage";

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
      // log(responseData.toString());

      if (response.statusCode == 200) {
        commentList = List<CommentEntity>.from(responseData
            .map<dynamic>((e) => CommentEntity.fromMap(e))
            .toList());
        EasyLoading.dismiss();

        // Navigator.pushNamed(
        //   context,
        //   '/comment',
        // );
        // log("instance of blog::$commentList");
      }
      EasyLoading.dismiss();

      return <CommentEntity>[];
    } catch (e) {
      log("fetching comment error::$e");
      return <CommentEntity>[];
    }
  }
}
