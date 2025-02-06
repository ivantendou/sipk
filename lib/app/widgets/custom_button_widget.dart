import 'package:flutter/material.dart';

import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final void Function()? onTap;
  final Color buttonColor;
  final Color textColor;
  final FontWeight? fontWeight;

  const CustomButtonWidget({
    Key? key,
    required this.text,
    required this.width,
    this.height = 40,
    required this.onTap,
    this.buttonColor = ColorsConstant.primary,
    this.textColor = ColorsConstant.white,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyleConstant.body.copyWith(
              color: textColor,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
