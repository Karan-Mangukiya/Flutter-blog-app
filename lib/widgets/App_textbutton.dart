import 'package:blog_app/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextButton extends StatelessWidget {
  AppTextButton({
    Key? key,
    required this.onPressed,
    this.title,
    this.minimumSize,
    this.textColor,
    this.iconColor,
    this.leadingIcon,
    this.trailingIcon,
    this.isIcon = false,
    this.isLeadingIcon = false,
    this.mainAxisSize,
  }) : super(key: key);

  String? title;
  Size? minimumSize;
  bool? isIcon;
  bool? isLeadingIcon;
  IconData? leadingIcon;
  IconData? trailingIcon;
  Color? textColor;
  Color? iconColor;
  MainAxisSize? mainAxisSize;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        primary: AppColors.kEEEEEE,
        minimumSize: minimumSize ??
            const Size(
              325,
              58,
            ),
      ),
      child: Row(
        mainAxisSize: mainAxisSize ?? MainAxisSize.min,
        children: [
          (isLeadingIcon ?? false)
              ? Icon(
                  leadingIcon,
                  color: iconColor ?? AppColors.k7C40FA,
                )
              : const SizedBox.shrink(),
          Text(
            title ?? '',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: textColor ?? AppColors.k7C40FA,
            ),
          ),
          (isIcon ?? false)
              ? Icon(
                  trailingIcon,
                  color: iconColor ?? AppColors.k7C40FA,
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
