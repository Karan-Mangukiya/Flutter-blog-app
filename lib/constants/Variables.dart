import 'package:blog_app/constants/Colors.dart';

import 'package:flutter/material.dart';

// import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;

GlobalKey<FormState> loginGlobalKey = GlobalKey<FormState>();
GlobalKey<FormState> signUpGlobalkey = GlobalKey<FormState>();

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController commentController = TextEditingController();

//For Api integration
const baseUrl = "https://analytics.youzeetech.com/wp-json";

//For auth token
const auth = "jwt-auth/v1";
const userName = "admin";
const password = "jRE1uMAdz8TLJPIe@Z2qAHIM";
const createUserEndpoint = 'wp/v2/users';
const addCommentEndpoint = 'wp/v2/comments';

//For using title of blog
const List<String> listOfBlogTitle = [
  "10 Cooking Lessons",
  "How to be Super Hores",
];

const List<String> listOfUserName = [
  'Amanda',
  'Queen',
];

//For appbar action button
List<Widget>? actions = [
  IconButton(
    splashColor: AppColors.kFFFFFF,
    icon: const Icon(
      Icons.bookmark_border_outlined,
      color: AppColors.k1A1B23,
    ),
    onPressed: () {},
  ),
  IconButton(
    splashColor: AppColors.kFFFFFF,
    icon: const Icon(
      Icons.search,
      color: AppColors.k1A1B23,
    ),
    onPressed: () {},
  ),
];
