// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class FolderCardWidget extends StatelessWidget {
  final String folderName;
  final void Function()? onTap;

  const FolderCardWidget({
    Key? key,
    required this.folderName,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 156,
          decoration: const BoxDecoration(
            color: ColorsConstant.primary,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                folderName,
                style: TextStyleConstant.subHeading2.copyWith(
                    fontWeight: FontWeight.bold, color: ColorsConstant.white),
              ),
              ClipOval(
                child: Container(
                  width: 40,
                  height: 40,
                  color: ColorsConstant.white,
                  child: Assets.images.arrowRight.svg(
                    fit: BoxFit.scaleDown,
                    colorFilter: const ColorFilter.mode(
                      ColorsConstant.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
