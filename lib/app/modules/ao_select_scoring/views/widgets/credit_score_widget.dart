// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class CreditScoreWidget extends StatelessWidget {
  final String? score;

  const CreditScoreWidget({
    Key? key,
    required this.score,
  }) : super(key: key);

  bool get isUnrated {
    return score == null ||
        score!.isEmpty ||
        score!.toLowerCase() == 'null' ||
        score == 'Belum Dinilai';
  }

  @override
  Widget build(BuildContext context) {
    final displayText = isUnrated ? 'Belum Dinilai' : 'Skor: ${score!}';

    return Container(
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
          displayText,
          style: TextStyleConstant.body.copyWith(
            fontWeight: FontWeight.bold,
            color: ColorsConstant.primary,
          ),
        ),
      ),
    );
  }
}
