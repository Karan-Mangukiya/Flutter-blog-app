import 'package:blog_app/Screen/Blogdetail_screen.dart';
import 'package:blog_app/Screen/Comments_screen.dart';
import 'package:blog_app/Screen/GalleryScreen.dart';
import 'package:blog_app/Screen/Login_screen.dart';
import 'package:blog_app/Screen/Onboarding.dart';
import 'package:blog_app/Screen/Popular_screen.dart';
import 'package:blog_app/Screen/Recent_screen.dart';

import 'package:blog_app/Screen/Signup_screen.dart';

import 'package:blog_app/Screen/home_screen.dart';

import 'package:blog_app/provider/blogscreen_provider.dart';

import 'package:blog_app/controller/drawer_controller.dart';
import 'package:blog_app/provider/commentscreen_provider.dart';
import 'package:blog_app/provider/homescreen_provider.dart';

import 'package:blog_app/controller/pageview_controller.dart';
import 'package:blog_app/provider/authantication.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PageViewController>(
          create: (_) => PageViewController(),
        ),
        ChangeNotifierProvider<AppDrawerController>(
          create: (_) => AppDrawerController(),
        ),
        ChangeNotifierProvider<HomeScreenProvider>(
          create: (_) => HomeScreenProvider(),
        ),
        ChangeNotifierProvider<BlogDetailScreenProvider>(
          create: (_) => BlogDetailScreenProvider(),
        ),
        ChangeNotifierProvider<Authantication>(
          create: (_) => Authantication(),
        ),
        ChangeNotifierProvider<commentScreenProvider>(
          create: (_) => commentScreenProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();

    Provider.of<Authantication>(context).authToken(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.purple),
      builder: EasyLoading.init(),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnBoarding(),
        '/login': (context) => const LogIn(),
        '/signup': (context) => const SignUp(),
        '/home': (context) => const HomeScreen(),
        '/blogdetail': (context) => BlogDetailScreen(),
        '/recent': (context) => const RecentScreen(),
        '/popular': (context) => const PopularScreen(),
        '/gallery': (context) => const GalleryScreen(),
        '/comment': (context) => CommentsScreen(),
      },
    );
  }
}
