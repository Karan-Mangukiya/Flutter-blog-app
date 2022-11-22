// ignore: file_names
import 'package:blog_app/Utils.dart';
import 'package:blog_app/constants/Colors.dart';
import 'package:blog_app/provider/blogscreen_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SharingComponent extends StatelessWidget {
  SharingComponent({
    Key? key,
    this.isPopular = false,
    this.commentCount = 0,
    this.blogId,
  }) : super(key: key);

  bool isPopular;
  int? commentCount;
  int? blogId;

  @override
  Widget build(BuildContext context) {
    final blogScreenProvider =
        Provider.of<BlogDetailScreenProvider>(context, listen: false);
    // final isLoad = blogScreenProvider.isLoading;
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            shareContent();
          },
          child: Icon(
            Icons.share_outlined,
            color: isPopular ? AppColors.k989898 : AppColors.k1A1B23,
          ),
        ),
        Text(
          "0",
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: isPopular ? AppColors.k989898 : AppColors.k1A1B23,
          ),
        ),
        isPopular
            ? const SizedBox(
                width: 20,
              )
            : const Spacer(),
        Icon(
          Icons.favorite_border,
          color: isPopular ? AppColors.k989898 : AppColors.k1A1B23,
        ),
        Text(
          "0",
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: isPopular ? AppColors.k989898 : AppColors.k1A1B23,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: (() {
            blogScreenProvider.fatchComment(blogId ?? 0, context);
            Navigator.pushNamed(
              context,
              '/comment',
            );
          }),
          child: Icon(
            Icons.chat_outlined,
            color: isPopular ? AppColors.k989898 : AppColors.k1A1B23,
          ),
        ),
        Text(
          commentCount.toString(),
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: isPopular ? AppColors.k989898 : AppColors.k1A1B23,
          ),
        ),
        isPopular ? const Spacer() : const SizedBox.shrink(),
        if (isPopular)
          const Icon(
            Icons.bookmark_border_outlined,
            color: AppColors.k1A1B23,
          ),
      ],
    );
  }
}
