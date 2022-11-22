import 'package:blog_app/widgets/page_view.dart';

import 'package:blog_app/constants/Colors.dart';

import 'package:blog_app/controller/pageview_controller.dart';
import 'package:blog_app/widgets/App_textbutton.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: const Color(0xffDBDBDB),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              color: AppColors.kFFFFFF,
              child: Column(
                children: [
                  const Divider(
                    color: AppColors.k7C40FA,
                    height: 6,
                    thickness: 6,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        spacing: 2.0,
                        radius: 4.0,
                        dotWidth: 15.0,
                        dotHeight: 5.0,
                        paintStyle: PaintingStyle.fill,
                        dotColor: AppColors.k7C40FA.withOpacity(0.15),
                        activeDotColor: AppColors.k7C40FA,
                      )),
                  const Expanded(
                    child: AppPageView(),
                  ),
                  buttons(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buttons(context) {
  final controller = Provider.of<PageViewController>(context);

  return controller.currentPage == 2
      ? const SizedBox.shrink()
      : Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: AppTextButton(
                title: 'Skip',
                minimumSize: const Size(150, 58),
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: AppTextButton(
                isIcon: true,
                trailingIcon: Icons.arrow_forward,
                title: 'Next',
                minimumSize: const Size(150, 58),
                onPressed: () {
                  pageController.animateToPage(
                    controller.currentPage == 0 ? 1 : 2,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                },
              ),
            ),
          ],
        );
}
