import 'package:blog_app/constants/Colors.dart';
import 'package:blog_app/constants/Strings.dart';
import 'package:blog_app/widgets/App_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              mainText,
              style: GoogleFonts.poppins(
                fontSize: 35,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            mainText1,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 35,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            subText,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.k747474.withOpacity(0.6),
            ),
          ),
          Text(
            subText1,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.k747474.withOpacity(0.6),
            ),
          ),
          const SizedBox(
            height: 37,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: AppButton(
              title: getStarted,
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ),
        ],
      ),
    );
  }
}
