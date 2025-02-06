// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class HeaderWithSeeAllWidget extends StatelessWidget {
  final String title;

  const HeaderWithSeeAllWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyleConstant.subHeading2.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Lihat Semua',
              style: TextStyleConstant.caption.copyWith(
                color: ColorsConstant.primary,
              ),
            ),
            const SizedBox(width: 6),
            Assets.images.chevronRight.svg(width: 14),
          ],
        ),
      ],
    );
  }
}
