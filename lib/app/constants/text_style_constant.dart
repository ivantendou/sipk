import 'package:flutter/material.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/fonts.gen.dart';

class TextStyleConstant {
  TextStyleConstant._();

  static const TextStyle footnote = TextStyle(
    fontFamily: FontFamily.nunito,
    color: ColorsConstant.black,
    fontSize: 12, 
    height: 1.4, 
  );

  static const TextStyle caption = TextStyle(
    fontFamily: FontFamily.nunito,
    color: ColorsConstant.black,
    fontSize: 14, 
    height: 1.5, 
  );

  static const TextStyle body = TextStyle(
    fontFamily: FontFamily.nunito,
    color: ColorsConstant.black,
    fontSize: 16, 
    height: 1.6, 
  );

  static const TextStyle subHeading2 = TextStyle(
    fontFamily: FontFamily.nunito,
    color: ColorsConstant.black,
    fontSize: 18, 
    height: 1.5, 
    fontWeight: FontWeight.w500,
  );

  static const TextStyle subHeading = TextStyle(
    fontFamily: FontFamily.nunito,
    color: ColorsConstant.black,
    fontSize: 20, 
    height: 1.4, 
    fontWeight: FontWeight.w500,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: FontFamily.nunito,
    color: ColorsConstant.black,
    fontSize: 22, 
    height: 1.3, 
    fontWeight: FontWeight.w600,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: FontFamily.nunito,
    color: ColorsConstant.black,
    fontSize: 24,
    height: 1.4, 
    fontWeight: FontWeight.w600,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: FontFamily.nunito,
    color: ColorsConstant.black,
    fontSize: 30,
    height: 1.3, 
    fontWeight: FontWeight.w600,
  );

  static const TextStyle h1 = TextStyle(
    fontFamily: FontFamily.nunito,
    color: ColorsConstant.black,
    fontSize: 36,
    height: 1.2, 
    fontWeight: FontWeight.w700,
  );
}