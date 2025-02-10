// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class FilterButtonWidget extends StatelessWidget {
  final void Function()? onTap;

  const FilterButtonWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 28,
        decoration: const BoxDecoration(
          color: ColorsConstant.primary,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.filter.svg(
              width: 16,
              colorFilter: const ColorFilter.mode(
                ColorsConstant.white,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              'Filter',
              style: TextStyleConstant.caption.copyWith(
                color: ColorsConstant.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
