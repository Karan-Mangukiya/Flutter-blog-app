// ignore: file_names
import 'package:blog_app/constants/Colors.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  AppButton({
    Key? key,
    required this.onPressed,
    this.title,
    this.minimumSize,
    this.buttonColor,
    this.buttonBorderColor,
  }) : super(key: key);

  String? title;
  Size? minimumSize;
  Color? buttonColor;
  Color? buttonBorderColor;

  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: buttonColor ?? AppColors.k7C40FA,
        minimumSize: minimumSize ??
            const Size(
              325,
              58,
            ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: buttonBorderColor ?? AppColors.k7C40FA,
          ),
        ),
      ),
      child: Text(
        title ?? '',
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.kFFFFFF,
        ),
      ),
    );
  }
}
