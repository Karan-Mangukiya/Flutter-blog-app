// ignore: file_names
import 'package:blog_app/constants/Colors.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class UserDetailOfBlog extends StatelessWidget {
  UserDetailOfBlog({
    Key? key,
    this.index,
    this.textColor,
    this.autherImage,
    this.autherName,
  }) : super(key: key);

  int? index;
  Color? textColor;
  String? autherImage;
  String? autherName;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.kDBDBDB,
          backgroundImage: Image.network(autherImage ?? '').image,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: RichText(
                text: TextSpan(
                  text: 'By ',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textColor ?? AppColors.k1D1D20.withOpacity(0.5),
                  ),
                  children: [
                    TextSpan(
                      text: autherName,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: textColor ?? AppColors.k1D1D20,
                      ),
                    ),
                    TextSpan(
                      text: ' in ',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: textColor ?? AppColors.k1D1D20.withOpacity(0.5),
                      ),
                    ),
                    TextSpan(
                      text: 'Travel ',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: textColor ?? AppColors.k1D1D20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FittedBox(
              child: Text(
                '4 days ago • 5 mins read',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: textColor ?? AppColors.k1D1D20.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
