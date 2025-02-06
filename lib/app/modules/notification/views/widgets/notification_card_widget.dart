// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class NotificationCardWidget extends StatelessWidget {
  final String message;
  final String time;

  const NotificationCardWidget({
    Key? key,
    required this.message,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorsConstant.white,
        border: Border(
          bottom: BorderSide(color: ColorsConstant.grey300, width: 1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Container(
              width: 40,
              height: 40,
              color: ColorsConstant.primary,
              child: Assets.images.bell.svg(
                fit: BoxFit.scaleDown,
                colorFilter: const ColorFilter.mode(
                  ColorsConstant.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: TextStyleConstant.body.copyWith(height: 1.5,),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyleConstant.footnote.copyWith(
                    color: ColorsConstant.grey700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
