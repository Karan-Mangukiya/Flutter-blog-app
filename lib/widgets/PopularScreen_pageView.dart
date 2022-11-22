// ignore: file_names
import 'package:blog_app/widgets/BlogDetail.dart';
import 'package:flutter/material.dart';

final PageController popularPageController = PageController(
  initialPage: 0,
);

class PopularPageView extends StatelessWidget {
  const PopularPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: popularPageController,
      itemCount: 2,
      itemBuilder: (context, index) {
        return AppBlogDetail(
          index: index,
          fontSize: 24,
          leftPadfding: 20,
          rightPadding: 20,
        );
      },
    );
  }
}
