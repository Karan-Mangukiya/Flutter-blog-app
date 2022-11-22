import 'package:blog_app/constants/Colors.dart';
import 'package:blog_app/constants/Strings.dart';
import 'package:blog_app/constants/Variables.dart';

import 'package:blog_app/widgets/PopularScreen_pageView.dart';
import 'package:blog_app/widgets/ShareComponent.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Utils.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kFFFFFF,
        elevation: 0,
        leading: leadingButton(context),
        centerTitle: true,
        title: Text(
          popularAppbarText,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.k1A1B23,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/gallery');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 343,
              width: double.infinity,
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
                  const Expanded(child: PopularPageView()),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SmoothPageIndicator(
                        // textDirection: TextDirection.ltr,
                        controller: popularPageController,
                        count: listOfBlogTitle.length,
                        effect: WormEffect(
                          spacing: 2.0,
                          radius: 10,
                          dotWidth: 10,
                          dotHeight: 10,
                          paintStyle: PaintingStyle.fill,
                          dotColor: AppColors.k7C40FA.withOpacity(0.15),
                          activeDotColor: AppColors.k7C40FA,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    color: AppColors.kEEEEEE,
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20,
                      bottom: 20,
                    ),
                    child: SharingComponent(
                      isPopular: true,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
