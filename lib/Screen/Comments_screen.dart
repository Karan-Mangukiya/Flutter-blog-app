import 'package:blog_app/Utils.dart';
import 'package:blog_app/constants/Colors.dart';
import 'package:blog_app/constants/Images.dart';
import 'package:blog_app/constants/Strings.dart';
import 'package:blog_app/provider/blogscreen_provider.dart';

import 'package:blog_app/widgets/UserComment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    final blogScreenProvider = Provider.of<BlogDetailScreenProvider>(context);
    final commentList = blogScreenProvider.commentList;

    // log(commentList.toString());
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
          commentHeading,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.k1A1B23,
          ),
        ),
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: commentList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 20,
                right: MediaQuery.of(context).size.width / 20,
                top: MediaQuery.of(context).size.height / 20,
              ),
              child: commentComponent(
                authorName: commentList[index].authorName,
                comment: commentList[index].content?.rendered,
                commentTime: commentList[index].date,
              ),
            );
          })),
    );
  }
}

Widget commentComponent({authorName, comment, commentTime}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      UserComment(
        userCommentTime: commentTime,
        userImage: AppImages.userImage,
        userName: authorName,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Html(data: comment, style: {
          'p': Style(
            fontSize: FontSize(12),
            fontWeight: FontWeight.w400,
            color: AppColors.k989898,
          ),
        }

            //  GoogleFonts.poppins(
            //   fontSize: 12,
            //   fontWeight: FontWeight.w400,
            //   color: AppColors.k989898,
            // ),
            ),
      ),
      Row(
        children: const [
          Icon(
            Icons.favorite_border,
          ),
          Text("85"),
          // Spacer(),
          // Icon(Icons.chat_outlined),
          // Text("85"),
        ],
      ),
      const SizedBox(
        height: 20,
        child: Divider(
          thickness: 2,
          color: AppColors.kDBDBDB,
        ),
      )
    ],
  );
}
