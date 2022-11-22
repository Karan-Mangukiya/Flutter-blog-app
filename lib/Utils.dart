// ignore_for_file: unnecessary_string_escapes

import 'package:blog_app/constants/Colors.dart';
import 'package:blog_app/constants/Images.dart';

import 'package:blog_app/constants/Variables.dart';
import 'package:blog_app/provider/authantication.dart';

import 'package:blog_app/widgets/App_container.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:share_plus/share_plus.dart';

import 'package:skeletons/skeletons.dart';

///For email validation
bool isEmailValid(String email) {
  Pattern pattern =
      '^(([^<>()[]\\.,;:s@"]+(.[^<>()[]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))';

  RegExp regex = RegExp(pattern.toString());
  return regex.hasMatch(email);
}

///For signin button
void signIn(context) {
  Navigator.pushNamed(context, '/home');

  if ((loginGlobalKey.currentState?.validate() ?? false)) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

///For signup button
void signUp(context) async {
  if ((signUpGlobalkey.currentState?.validate() ?? false)) {
    FocusManager.instance.primaryFocus?.unfocus();
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    await Provider.of<Authantication>(
      context,
      listen: false,
    ).createUser(emailController.text, emailController.text,
        passwordController.text, context);
  }
}

///For sharing content
void shareContent() {
  Share.share(AppImages.blogImage, subject: 'image path');
}

///For snackbar
void showSnackBar(String e, context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: AppColors.k7C40FA,
      content: Text(e),
    ),
  );
}

//Appbar leading button
Widget leadingButton(context) {
  return GestureDetector(
    onTap: (() {
      Navigator.pop(context);
    }),
    child: AppContainer(
      height: 45,
      width: 45,
      color: AppColors.k7C40FA,
      child: const Icon(
        Icons.arrow_back,
      ),
    ),
  );
}

///For add comment
// void sendComment(
//   context,
//   autherId,
//   autherName,
//   blogId,
// ) async {
//   FocusManager.instance.primaryFocus?.unfocus();
//   ScaffoldMessenger.of(context).hideCurrentSnackBar();

//   if (commentController.text != '') {
//     await Provider.of<BlogDetailScreenProvider>(context, listen: false)
//         .addComment(
//       autherId,
//       autherName,
//       blogId,
//       context,
//     );
//   } else {
//     showSnackBar('Please add comment', context);
//   }
// }

///Blog image skeleton
Widget blogImageSkeleton(context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 3.5,
    width: double.infinity,
    child: SkeletonAvatar(
      style: SkeletonAvatarStyle(
        width: double.infinity,
        height: 176,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

///For user details
Widget userDetailsSkeleton() {
  return Row(
    children: [
      SkeletonAvatar(
        style:
            SkeletonAvatarStyle(shape: BoxShape.circle, width: 40, height: 40),
      ),
      SizedBox(width: 8),
      Expanded(
        child: SkeletonParagraph(
          style: SkeletonParagraphStyle(
              lines: 2,
              spacing: 6,
              lineStyle: SkeletonLineStyle(
                height: 10,
                borderRadius: BorderRadius.circular(8),
              )),
        ),
      )
    ],
  );
}
