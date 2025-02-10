// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class OptionButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final String option;

  const OptionButtonWidget({
    Key? key,
    required this.onTap,
    required this.option,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 28,
        decoration: BoxDecoration(
          color: ColorsConstant.white,
          border: Border.all(color: ColorsConstant.primary, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              option,
              style: TextStyleConstant.caption.copyWith(
                color: ColorsConstant.primary,
              ),
            ),
            const SizedBox(width: 4),
            Assets.images.chevronDownThin.svg(
              width: 16,
              colorFilter: const ColorFilter.mode(
                ColorsConstant.primary,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
