import 'package:blog_app/Utils.dart';
import 'package:blog_app/constants/Colors.dart';
import 'package:blog_app/constants/Images.dart';
import 'package:blog_app/constants/Strings.dart';

import 'package:blog_app/widgets/App_container.dart';
import 'package:blog_app/widgets/UserDetail.dart';

import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import 'package:google_fonts/google_fonts.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: leadingButton(context),
        actions: [
          IconButton(onPressed: () {}, icon: Image.asset(AppImages.gallery))
        ],
        backgroundColor: AppColors.kFFFFFF,
        centerTitle: true,
        title: Text(
          galleryAppbarText,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.k1A1B23,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: swipeCard(context),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Row(
              children: [
                UserDetailOfBlog(),
                const Spacer(),
                Text(
                  '182',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.k1A1B23,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.kDBDBDB,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.favorite,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

Widget swipeCard(context) {
  return Swiper(
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/comment');
        },
        child: AppContainer(
          height: MediaQuery.of(context).size.height / 1,
          borderColor: AppColors.kDBDBDB,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              AppImages.blogImage,
              fit: BoxFit.fill,
            ),
          ),
        ),
      );
    },
    itemCount: 5,
    itemWidth: 300.0,
    layout: SwiperLayout.STACK,
    axisDirection: AxisDirection.right,
  );
}
