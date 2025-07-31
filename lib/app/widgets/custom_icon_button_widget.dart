import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class CustomIconButtonWidget extends StatelessWidget {
  final Widget icon;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final bool isLoading;
  final void Function()? onTap;

  const CustomIconButtonWidget({
    Key? key,
    required this.icon,
    required this.text,
    this.backgroundColor = ColorsConstant.primary,
    this.textColor = ColorsConstant.white,
    this.isLoading = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(8)),
        child: isLoading
            ? Center(
                child: LoadingIndicator(
                  indicatorType: Indicator.ballBeat,
                  strokeWidth: 4.0,
                  colors: [Theme.of(context).secondaryHeaderColor],
                ),
              )
            : Row(
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
