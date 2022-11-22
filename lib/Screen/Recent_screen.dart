import 'package:blog_app/Utils.dart';
import 'package:blog_app/constants/Colors.dart';
import 'package:blog_app/constants/Images.dart';
import 'package:blog_app/constants/Strings.dart';
import 'package:blog_app/constants/Variables.dart';

import 'package:blog_app/widgets/App_container.dart';
import 'package:blog_app/widgets/ShareComponent.dart';

import 'package:blog_app/widgets/UserDetail.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentScreen extends StatelessWidget {
  const RecentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kFFFFFF,
        elevation: 1,
        actions: actions,
        leading: leadingButton(context),
        centerTitle: true,
        title: Text(
          recentAppbarText,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.k1A1B23,
          ),
        ),
      ),
      body: ListView(
        children: [
          carouselSlider(),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 72,
                  // width: 272,
                  color: AppColors.kFFFFFF,
                  child: Text(
                    recentText,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.k1A1B23,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 45,
                  child: Text(
                    commentDescription,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.k989898,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                UserDetailOfBlog(),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            color: AppColors.kDBDBDB,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: 20,
            ),
            child: SharingComponent(),
          )
        ],
      ),
    );
  }
}

Widget carouselSlider() {
  return CarouselSlider.builder(
      options: CarouselOptions(
        enlargeCenterPage: false,
        viewportFraction: 0.8,
        aspectRatio: 1,
        reverse: true,
        initialPage: 1,
      ),
      itemCount: 5,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return GestureDetector(
          onTap: (() {
            Navigator.pushNamed(context, "/popular");
          }),
          child: AppContainer(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 300,
            width: 300,
            color: AppColors.kDBDBDB,
            borderColor: AppColors.kDBDBDB,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                AppImages.blogImage,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      });
}
