// ignore: file_names
import 'package:blog_app/constants/Colors.dart';

import 'package:blog_app/constants/Strings.dart';
import 'package:blog_app/controller/drawer_controller.dart';
import 'package:blog_app/widgets/App_container.dart';
import 'package:blog_app/widgets/App_textbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AppDrawer extends StatelessWidget {
  AppDrawer({
    Key? key,
    this.autherName,
    this.autherImage,
  }) : super(key: key);

  String? autherName;
  String? autherImage;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 15,
              right: MediaQuery.of(context).size.width / 15,
              top: MediaQuery.of(context).size.height / 50,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: AppColors.kDBDBDB,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 23,
                    backgroundColor: AppColors.kDBDBDB,
                    backgroundImage: Image.network(autherImage ?? '').image,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        autherName ?? '',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.k1A1B23,
                        ),
                      ),
                      Text(
                        userProffesion,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.k919191,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            color: AppColors.kEEEEEE,
            thickness: 2,
          ),
          const SizedBox(
            height: 25,
          ),
          drawerOption(context),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 15,
              right: MediaQuery.of(context).size.width / 15,
            ),
            child: AppTextButton(
              isLeadingIcon: true,
              mainAxisSize: MainAxisSize.max,
              leadingIcon: Icons.logout,
              title: logoutButtonText,
              textColor: AppColors.kFF4A4A,
              iconColor: AppColors.kFF4A4A,
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

Widget drawerOption(context) {
  final controller = Provider.of<AppDrawerController>(context);

  return Padding(
    padding: EdgeInsets.only(
      left: MediaQuery.of(context).size.width / 15,
      right: MediaQuery.of(context).size.width / 15,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppContainer(
          value: 1,
          groupValue: controller.grpValue,
          selected: 1 == controller.grpValue,
          onTap: () {
            controller.selectedValue(1);
            // Navigator.pushNamed(context, '/home');
          },
          height: 50,
          color:
              controller.grpValue == 1 ? AppColors.k7C40FA : AppColors.kFFFFFF,
          borderColor:
              controller.grpValue == 1 ? AppColors.k7C40FA : AppColors.kEEEEEE,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                home,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: controller.grpValue == 1
                      ? AppColors.kFFFFFF
                      : AppColors.k1A1B23,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        AppContainer(
          value: 2,
          groupValue: controller.grpValue,
          selected: 2 == controller.grpValue,
          onTap: () {
            controller.selectedValue(2);
          },
          color:
              controller.grpValue == 2 ? AppColors.k7C40FA : AppColors.kFFFFFF,
          borderColor:
              controller.grpValue == 2 ? AppColors.k7C40FA : AppColors.kEEEEEE,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                categories,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: controller.grpValue == 2
                      ? AppColors.kFFFFFF
                      : AppColors.k1A1B23,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        AppContainer(
          value: 3,
          groupValue: controller.grpValue,
          selected: 3 == controller.grpValue,
          onTap: () {
            controller.selectedValue(3);
          },
          height: 50,
          color:
              controller.grpValue == 3 ? AppColors.k7C40FA : AppColors.kFFFFFF,
          borderColor:
              controller.grpValue == 3 ? AppColors.k7C40FA : AppColors.kEEEEEE,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                history,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: controller.grpValue == 3
                      ? AppColors.kFFFFFF
                      : AppColors.k1A1B23,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        AppContainer(
          value: 4,
          groupValue: controller.grpValue,
          selected: 4 == controller.grpValue,
          onTap: () {
            controller.selectedValue(4);
          },
          height: 50,
          color:
              controller.grpValue == 4 ? AppColors.k7C40FA : AppColors.kFFFFFF,
          borderColor:
              controller.grpValue == 4 ? AppColors.k7C40FA : AppColors.kEEEEEE,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                bookmark,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: controller.grpValue == 4
                      ? AppColors.kFFFFFF
                      : AppColors.k1A1B23,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}
