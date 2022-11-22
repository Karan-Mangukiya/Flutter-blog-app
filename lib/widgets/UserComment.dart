// ignore: file_names
import 'package:blog_app/constants/Colors.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class UserComment extends StatelessWidget {
  UserComment({
    Key? key,
    this.userName,
    this.userCommentTime,
    this.userImage,
  }) : super(key: key);

  String? userName;
  DateTime? userCommentTime;
  String? userImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 22,
          backgroundImage: Image.network(userImage ?? '').image,
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName ?? '',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.k000000,
              ),
            ),
            Text(
              userCommentTime.toString(),
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.k818181,
              ),
            )
          ],
        )
      ],
    );
  }
}
