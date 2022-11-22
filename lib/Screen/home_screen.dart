import 'package:blog_app/Utils.dart';
import 'package:blog_app/constants/Colors.dart';
import 'package:blog_app/constants/Images.dart';
import 'package:blog_app/constants/Strings.dart';
import 'package:blog_app/constants/Variables.dart';

import 'package:blog_app/provider/homescreen_provider.dart';
import 'package:blog_app/widgets/App_blog.dart';

import 'package:blog_app/widgets/App_drawer.dart';
import 'package:blog_app/widgets/BlogDetail.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  bool isAutherImageLoading = false;

  int? autherId;

  int? i;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });

    Provider.of<HomeScreenProvider>(context, listen: false).listOfBlogs().then(
      (value) {
        Provider.of<HomeScreenProvider>(context, listen: false)
            .autherData(autherId ?? 1);
        Provider.of<HomeScreenProvider>(context, listen: false)
            .imagesOfBlog(i ?? 0);
        setState(() {
          isLoading = false;
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeScreenProvider>(context);

    final blogList = provider.blogsList;
    final imagesOfBlog = provider.blogImage;
    final autherData = provider.auther;

    final blogImage =
        imagesOfBlog.mediaDetails?.sizes?.entries.first.value.sourceUrl;

    return Scaffold(
        drawer: AppDrawer(
          autherName: autherData.name,
          autherImage: autherData.avatarUrls?['24'],
        ),
        drawerScrimColor: AppColors.k818181,
        appBar: AppBar(
          leading: leadingIcon(autherData.avatarUrls?["24"] ?? ""),
          actions: actions,
          elevation: 1,
          centerTitle: true,
          backgroundColor: AppColors.kFFFFFF,
          title: Text(
            homeAppbarText,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.k1A1B23,
            ),
          ),
        ),
        body: isLoading
            ? homescreenSkeleton(
                context,
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: blogList.length,
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 15,
                  right: MediaQuery.of(context).size.width / 15,
                  top: MediaQuery.of(context).size.height / 30,
                ),
                itemBuilder: (context, index) {
                  autherId = blogList[index].author;
                  i = index;
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/blogdetail',
                        arguments: [
                          blogList[index].id,
                          autherData.name,
                          blogList[index].title?.rendered,
                          autherData.avatarUrls?['24'],
                          blogList[index].featuredMedia == 0
                              ? AppImages.blogImage
                              : blogImage,
                        ],
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppBlog(
                          blogId: blogList[index].id,
                          title: blogList[index].title?.rendered,
                          autherImage: autherData.avatarUrls?['24'],
                          blogImage: blogList[index].featuredMedia == 0
                              ? AppImages.blogImage
                              : blogImage,
                          autherName: autherData.name,
                          index: index,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppBlogDetail(
                          title: blogList[index].title?.rendered,
                          blogContent: blogList[index].content?.rendered,
                          autherImage: autherData.avatarUrls?['24'],
                          autherName: autherData.name,
                          index: index,
                        ),
                        const Divider(
                          thickness: 2,
                          color: AppColors.kEEEEEE,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                }));
  }
}

Widget leadingIcon(String autherImage) {
  return Padding(
    padding: const EdgeInsets.only(left: 15),
    child: Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 1,
              color: AppColors.kDBDBDB,
            ),
          ),
          child: CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.kDBDBDB,
            backgroundImage: Image.network(
              autherImage,
              fit: BoxFit.fill,
            ).image,
          ),
        ),
      ),
    ),
  );
}

Widget homescreenSkeleton(context) {
  return ListView.builder(
      itemCount: 5,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 15,
        right: MediaQuery.of(context).size.width / 15,
        top: MediaQuery.of(context).size.height / 30,
      ),
      itemBuilder: ((context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blogImageSkeleton(context),
            const SizedBox(
              height: 20,
            ),
            SkeletonParagraph(
              style: SkeletonParagraphStyle(
                lines: 1,
                lineStyle: SkeletonLineStyle(
                  height: 10,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            userDetailsSkeleton(),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      }));
}
