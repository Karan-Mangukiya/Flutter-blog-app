// ignore: file_names
import 'package:blog_app/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AppTextFormField extends StatelessWidget {
  AppTextFormField({
    Key? key,
    this.hintText,
    this.validator,
    this.controller,
    this.suffixIcon,
  }) : super(key: key);

  String? hintText;
  TextEditingController? controller;

  Widget? suffixIcon;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        fontSize: 16,
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          fontSize: 14,
        ),
        contentPadding: EdgeInsets.all(10),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.k7C40FA, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.kEEEEEE, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.kFF4A4A, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.kFF4A4A, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: validator,
      cursorColor: AppColors.k7C40FA,
    );
  }
}
