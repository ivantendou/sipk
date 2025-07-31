// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class LabelValueWidget extends StatelessWidget {
  final String label;
  final String? value;

  const LabelValueWidget({
    Key? key,
    required this.label,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyleConstant.body.copyWith(
            color: ColorsConstant.grey900,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          overflow: TextOverflow.ellipsis,
          value ?? "-",
          style: TextStyleConstant.body
              .copyWith(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ],
    );
  }
}
