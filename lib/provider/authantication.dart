import 'dart:convert';
import 'dart:developer';

import 'dart:io';

import 'package:blog_app/Utils.dart';

import 'package:blog_app/constants/Variables.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Authantication extends ChangeNotifier {
  // bool isLoading = false;
  int autherId = 1;

  Future<void> storeToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('authtoken', token);
  }

  Future<void> authToken(context) async {
    try {
      const url = "$baseUrl/$auth/token";

      Map<String, String> userData = <String, String>{
        "username": userName,
        "password": password,
      };

      var response = await http.post(Uri.parse(url), body: userData);

      var responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        var token = responseData["token"];
        // log("authToken::$token");

        storeToken(token);
      } else {
        showSnackBar(responseData["message"], context);
      }
    } catch (e) {
      log('error message : $e');
      // showSnackBar(e.toString(), context);
    }
  }

  Future<void> createUser(
      String email, String username, String password, context) async {
    EasyLoading.show(status: 'loading...');

    try {
      const url = "$baseUrl/$createUserEndpoint";
      Map<String, dynamic> userData = <String, dynamic>{
        "email": email.trim(),
        "username": username.trim(),
        "password": password.trim(),
      };

      SharedPreferences pref = await SharedPreferences.getInstance();
      var authToken = pref.getString('authtoken');

      final response = await http.post(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $authToken",
          // HttpHeaders.contentTypeHeader: "application/json",
        },
        body: userData,
      );

      final Map<String, dynamic> createUserData = json.decode(response.body);

      if (response.statusCode == 201) {
        log(createUserData.toString());
        autherId = createUserData["id"];
        log("userId::$autherId");
        showSnackBar('Succcessfullu user created.', context);
        // Navigator.pushNamed(context, '/home');
      }

      if (response.statusCode == 400) {
        showSnackBar(createUserData["message"], context);
      }
      if (createUserData["code"] == "existing_user_login") {
        showSnackBar(createUserData["message"], context);
      }
      EasyLoading.dismiss();
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }
}
