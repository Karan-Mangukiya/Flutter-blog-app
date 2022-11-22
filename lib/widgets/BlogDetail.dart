// ignore: file_names
import 'package:blog_app/constants/Colors.dart';

import 'package:blog_app/widgets/UserDetail.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AppBlogDetail extends StatelessWidget {
  AppBlogDetail({
    Key? key,
    this.index,
    this.title,
    this.fontSize,
    this.leftPadfding,
    this.rightPadding,
    this.blogContent,
    this.autherImage,
    this.autherName,
  }) : super(key: key);

  int? index;
  double? fontSize;
  double? leftPadfding;
  double? rightPadding;
  String? title;
  String? blogContent;
  String? autherImage;
  String? autherName;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding:
          EdgeInsets.only(left: leftPadfding ?? 0, right: rightPadding ?? 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: GoogleFonts.poppins(
              fontSize: fontSize ?? 18,
              fontWeight: FontWeight.w500,
              color: AppColors.k1A1B23,
            ),
          ),
          // Html(
          //   data: blogContent,
          //   style: {
          //     'p': Style(
          //       color: AppColors.k989898,
          //       fontSize: const FontSize(12),
          //       fontWeight: FontWeight.w400,
          //     ),
          //   },
          //  Text(
          //   blogContent ?? "",
          //   style: GoogleFonts.poppins(
          //     fontSize: 12,
          //     fontWeight: FontWeight.w400,
          //     color: AppColors.k989898,
          //   ),
          // ).toString(),
          // ),
          const SizedBox(
            height: 20,
          ),
          UserDetailOfBlog(
            autherImage: autherImage,
            autherName: autherName,
            index: index,
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
