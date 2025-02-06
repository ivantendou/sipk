import 'package:flutter/material.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class CustomIconButtonWidget extends StatelessWidget {
  final Widget icon;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final void Function()? onTap;

  const CustomIconButtonWidget ({
    Key? key,
    required this.icon,
    required this.text,
    this.backgroundColor = ColorsConstant.primary,
    this.textColor = ColorsConstant.white,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 6),
            Text(
              text,
              style: TextStyleConstant.body.copyWith(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
