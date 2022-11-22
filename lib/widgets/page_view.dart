import 'package:blog_app/Screen/First_page.dart';

import 'package:blog_app/Screen/Second_page.dart';
import 'package:blog_app/Screen/Third_page.dart';

import 'package:blog_app/controller/pageview_controller.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppPageView extends StatelessWidget {
  const AppPageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PageViewController>(context);
    return PageView(
      controller: pageController,
      onPageChanged: (int index) {
        controller.setCurrentPage(index);
      },
      children: const [
        FirstPage(),
        SecondPage(),
        ThirdPage(),
      ],
    );
  }
}
