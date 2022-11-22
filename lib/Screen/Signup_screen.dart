import 'package:blog_app/Utils.dart';
import 'package:blog_app/constants/Colors.dart';
import 'package:blog_app/constants/Images.dart';
import 'package:blog_app/constants/Strings.dart';
import 'package:blog_app/constants/Variables.dart';
import 'package:blog_app/widgets/App_button.dart';
import 'package:blog_app/widgets/App_container.dart';
import 'package:blog_app/widgets/App_textFormField.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: signUpGlobalkey,
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 20,
              right: MediaQuery.of(context).size.width / 20,
              top: MediaQuery.of(context).size.height / 20,
            ),
            child: Column(
              children: [
                Text(
                  signUpText,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: AppColors.k1D1D20,
                  ),
                ),
                Text(
                  signUpText1,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.k4A4A4A,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AppTextFormField(
                  controller: emailController,
                  hintText: emailText,
                  validator: (value) {
                    if (!isEmailValid(value ?? '') &&
                        (value?.isEmpty ?? false)) {
                      return emailErrorText;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextFormField(
                  controller: passwordController,
                  hintText: passText,
                  validator: (val) {
                    if ((val?.isEmpty ?? false)) {
                      return 'Enter a valid password';
                    } else if (val!.length < 8) {
                      return 'Enter a password greater than 8 digits';
                    }
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                AppButton(
                  title: signUpText,
                  onPressed: () {
                    signUp(context);
                  },
                  minimumSize: const Size(325, 50),
                ),
                const SizedBox(
                  height: 19,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: DottedLine(
                        direction: Axis.horizontal,
                        lineThickness: 2,
                        dashLength: 4.0,
                        dashColor: AppColors.kDDDDDD,
                        dashGapLength: 4.0,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        orWith,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.k818181,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: DottedLine(
                        direction: Axis.horizontal,
                        lineThickness: 2,
                        dashLength: 4.0,
                        dashColor: AppColors.kDDDDDD,
                        dashGapLength: 4.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                AppContainer(
                  height: 50,
                  width: 325,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        AppImages.googleImage,
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        google,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.k1A1B23,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    alreadyAcc,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.k818181,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
