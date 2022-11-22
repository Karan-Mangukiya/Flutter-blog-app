// ignore: file_names
import 'package:blog_app/constants/Colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppContainer extends StatelessWidget {
  AppContainer({
    Key? key,
    this.height,
    this.width,
    this.borderColor,
    this.color,
    this.child,
    this.value,
    this.groupValue,
    this.onTap,
    this.selected,
    this.padding,
    this.margin,
  }) : super(key: key);

  double? height;
  double? width;
  Color? borderColor;
  Widget? child;
  Color? color;
  int? value;
  int? groupValue;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  bool? selected;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: margin,
            padding: padding,
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(
                width: 1,
                color: (borderColor ?? AppColors.k7C40FA),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: child,
          ),
        ),
        selected ?? false
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 3,
                  height: 25,
                  decoration: BoxDecoration(
                    color: AppColors.kFFFFFF,
                    border: Border.all(
                      width: 2,
                      color: AppColors.kFFFFFF,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
