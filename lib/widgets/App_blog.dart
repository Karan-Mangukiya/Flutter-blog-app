import 'package:blog_app/Utils.dart';
import 'package:blog_app/constants/Colors.dart';

import 'package:blog_app/provider/homescreen_provider.dart';
import 'package:blog_app/widgets/App_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppBlog extends StatelessWidget {
  AppBlog({
    Key? key,
    this.blogId,
    this.index,
    this.blogImage,
    this.autherName,
    this.title,
    this.autherImage,
  }) : super(key: key);
  int? index;
  String? blogImage;
  int? blogId;
  String? autherName;
  String? title;
  String? autherImage;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeScreenProvider>(context);
    bool isLoad = controller.isBlogImageLoading;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        GestureDetector(
          onTap: (() {
            Navigator.pushNamed(
              context,
              '/blogdetail',
              arguments: [
                blogId,
                autherName,
                title,
                autherImage,
                blogImage,
              ],
            );
          }),
          child: AppContainer(
            height: MediaQuery.of(context).size.height / 3.5,
            width: double.infinity,
            borderColor: AppColors.kDBDBDB,
            color: AppColors.kDBDBDB,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: blogImage == null && isLoad
                  ? blogImageSkeleton(context)
                  : Image(
                      image: NetworkImage(blogImage ?? ''),
                      fit: BoxFit.fill,
                    ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kFFFFFF,
                ),
                child: const Icon(
                  Icons.chat,
                  color: AppColors.k989898,
                  size: 15,
                ),
              ),
              Text(
                '325',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.k1A1B23,
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.selectedFavorite(index ?? 0);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.kFFFFFF,
                  ),
                  child: Icon(
                    controller.isFavourite[index ?? 0] == false
                        ? Icons.favorite_border
                        : Icons.favorite,
                    color: controller.isFavourite[index ?? 0] == false
                        ? AppColors.k989898
                        : Colors.red,
                    size: 15,
                  ),
                ),
              ),
              Text(
                controller.countrlist[index ?? 0].toString(),
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.k1A1B23,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kFFFFFF,
                ),
                child: const Icon(
                  Icons.bookmark_border_outlined,
                  color: AppColors.k989898,
                  size: 15,
                ),
              ),
              Text(
                '325',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.k1A1B23,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
