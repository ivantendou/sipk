import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final void Function()? onTap;
  final Color buttonColor;
  final Color textColor;
  final Color borderColor;
  final FontWeight? fontWeight;
  final bool isLoading;

  const CustomButtonWidget({
    Key? key,
    required this.text,
    required this.width,
    this.height = 40,
    required this.onTap,
    this.buttonColor = ColorsConstant.primary,
    this.textColor = ColorsConstant.white,
    this.borderColor = Colors.transparent,
    this.fontWeight,
    this.isLoading = false,
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
          border: Border.all(color: borderColor),
        ),
        child: Center(
          child: isLoading
              ? Center(
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballBeat,
                    strokeWidth: 4.0,
                    colors: [Theme.of(context).secondaryHeaderColor],
                  ),
                )
              : Text(
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
