// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class CreditScoreBadgeWidget extends StatelessWidget {
  final String rating;
  final String score;

  const CreditScoreBadgeWidget({
    Key? key,
    required this.rating,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 124,
          height: 28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorsConstant.average100,
          ),
          child: Center(
            child: Text(
              rating,
              style: TextStyleConstant.body.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorsConstant.average600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: 124,
          height: 28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorsConstant.white,
            border: Border.all(
              color: ColorsConstant.primary,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              "Skor: $score/100",
              style: TextStyleConstant.body.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorsConstant.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
