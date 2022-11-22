import 'package:blog_app/Utils.dart';
import 'package:blog_app/constants/Colors.dart';
import 'package:blog_app/constants/Images.dart';
import 'package:blog_app/constants/Strings.dart';
import 'package:blog_app/constants/Variables.dart';

import 'package:blog_app/provider/authantication.dart';

import 'package:blog_app/provider/blogscreen_provider.dart';

import 'package:blog_app/widgets/App_container.dart';
import 'package:blog_app/widgets/App_textFormField.dart';
import 'package:blog_app/widgets/ShareComponent.dart';

import 'package:blog_app/widgets/UserDetail.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BlogDetailScreen extends StatefulWidget {
  BlogDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<BlogDetailScreen> createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  int? blogId;
  String? autherName;
  String? title;
  String? autherImage;
  String? blogImage;
  int? commentList;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // EasyLoading.show(status: 'loading...');
      setState(() {
        final args =
            ModalRoute.of(context)!.settings.arguments as List<dynamic>;
        blogId = args[0];
        autherName = args[1];
        title = args[2];
        autherImage = args[3];
        blogImage = args[4];

        final blogScreenProvider =
            Provider.of<BlogDetailScreenProvider>(context, listen: false);
        blogScreenProvider.fatchComment(blogId ?? 0, context).then((value) {
          setState(() {
            commentList = blogScreenProvider.commentList.length;
          });
          return EasyLoading.dismiss();
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final blogScreenProvider =
        Provider.of<BlogDetailScreenProvider>(context, listen: true);
    int autherId = Provider.of<Authantication>(context).autherId;
    var size = MediaQuery.of(context).size;

    // final commentList = blogScreenProvider.commentList;

    // log("blog image ::$blogImage");

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.kFFFFFF,
        centerTitle: true,
        leading: leadingButton(context),
        actions: actions,
        title: Text(
          blogDetailAppbarText,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.k1A1B23,
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          blog(
            context,
            blogImage,
            autherImage,
            autherName,
            size,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: size.width / 20,
              right: size.width / 20,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      color: AppColors.k7C40FA,
                      child: Text(
                        "\"",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColors.kFFFFFF,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          title ?? '',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColors.k1A1B23,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height / 6,
                  child: Text(
                    blogSubDetail,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.k989898,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: size.height / 2.50,
            width: double.infinity,
            color: AppColors.k7C40FA.withOpacity(0.2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width / 20,
                    top: size.width / 20,
                    bottom: size.height / 25,
                  ),
                  child: Text(
                    relatedPostText,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.k1A1B23,
                    ),
                  ),
                ),
                relatedPost(
                  context,
                  size,
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(
          //     left: size.width / 20,
          //     right: size.width / 20,
          //     top: size.height / 50,
          //     bottom: size.height / 50,
          //   ),
          //   child: GestureDetector(
          //     onTap: () {
          //       blogScreenProvider.fatchComment(blogId ?? 0, context);
          //     },
          //     child: Row(
          //       children: [
          //         Text(
          //           commentHeading,
          //           style: GoogleFonts.poppins(
          //             fontSize: 14,
          //             fontWeight: FontWeight.w500,
          //             color: AppColors.k000000,
          //           ),
          //         ),
          //         const Spacer(),
          //         Text(
          //           viewedComment,
          //           style: GoogleFonts.poppins(
          //             fontSize: 12,
          //             fontWeight: FontWeight.w400,
          //             color: AppColors.k818181,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // const Divider(
          //   color: AppColors.kEEEEEE,
          //   thickness: 2,
          // ),
          Padding(
            padding: EdgeInsets.only(
              left: size.width / 20,
              right: size.width / 20,
              top: size.height / 20,
              bottom: size.height / 20,
            ),
            child: commentBox(
              context,
              size,
              autherId,
              autherName,
              blogId,
              blogScreenProvider,
              // comment,
              // commentList,
            ),
          ),
          const Divider(
            color: AppColors.kEEEEEE,
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: size.width / 20,
              right: size.width / 20,
              top: size.height / 50,
              bottom: size.height / 50,
            ),
            child: SharingComponent(
              blogId: blogId,
              commentCount: commentList,
            ),
          ),
        ],
      ),
    );
  }
}

Widget blog(
  context,
  blogImage,
  autherImage,
  autherName,
  size,
) {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      GestureDetector(
        onTap: (() {
          Navigator.pushNamed(
            context,
            '/recent',
          );
        }),
        child: Container(
          height: size.height / 2.5,
          margin: const EdgeInsets.only(bottom: 35),
          width: double.infinity,
          color: AppColors.kDBDBDB,
          child: Image.network(
            blogImage ?? '',
            width: double.infinity,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          left: size.width / 20,
          right: size.width / 20,
        ),
        child: AppContainer(
          height: size.height / 10,
          width: double.infinity,
          color: AppColors.k7C40FA,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: UserDetailOfBlog(
              autherImage: autherImage,
              autherName: autherName,
              textColor: AppColors.kFFFFFF,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget commentBox(
    context, size, autherId, autherName, blogId, blogScreenProvider
    // comment,
    // List<CommentEntity> commentList,
    ) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // UserComment(
      //   userCommentTime: '18 Nov 2021, 08:00',
      //   userImage: AppImages.userImage,
      //   userName: autherName,
      // ),
      // Padding(
      //   padding: EdgeInsets.only(
      //     top: size.height / 50,
      //     bottom: size.height / 50,
      //   ),
      //   child: SizedBox(
      //     height: size.height / 10,
      //     child: Html(
      //         data: comment ?? 'commentList.first.content?.rendered',
      //         style: {
      //           'p': Style(
      //             fontSize: FontSize(12),
      //             fontWeight: FontWeight.w400,
      //             color: AppColors.k989898,
      //           )
      //         }),
      //   ),
      // ),
      AppTextFormField(
        hintText: 'write comment',
        controller: commentController,
        suffixIcon: IconButton(
          onPressed: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            if (commentController.text != '') {
              await Provider.of<BlogDetailScreenProvider>(context,
                      listen: false)
                  .addComment(
                autherId,
                autherName ?? '',
                blogId,
                context,
              );
              Provider.of<BlogDetailScreenProvider>(context, listen: false)
                  .fatchComment(blogId ?? 0, context)
                  .then((value) {
                return EasyLoading.dismiss();
              });
            } else {
              showSnackBar('Please write a comment', context);
            }
            // sendComment(
            //   context,
            //   autherId,
            //   autherName,
            //   blogId,
            // );
          },
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              AppImages.sendIcon,
              height: size.height / 20,
              width: size.width / 20,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget relatedPost(context, size) {
  final controller = Provider.of<BlogDetailScreenProvider>(context);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: 175,
        width: double.infinity,
        child: CarouselSlider.builder(
          itemCount: 2,
          itemBuilder: ((context, index, realIndex) {
            return Column(
              children: [
                AppContainer(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  height: 125,
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
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Text('demo'),
                ),
              ],
            );
          }),
          options: CarouselOptions(
              viewportFraction: 0.6,
              aspectRatio: 1,
              initialPage: 0,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                controller.updatePosition(index);
              }),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          left: size.width / 20,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: listOfBlogTitle.map(
            (i) {
              int index = listOfBlogTitle.indexOf(i);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(
                  // vertical: 10.0,
                  horizontal: 2.0,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: controller.currentPosition == index
                      ? AppColors.k7C40FA
                      : AppColors.k1A1B23,
                ),
              );
            },
          ).toList(),
        ),
      ),
    ],
  );
}
