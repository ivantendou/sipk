// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool centerTitle;

  const CustomAppBarWidget({
    Key? key,
    required this.title,
    this.actions,
    this.centerTitle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      title: Text(
        title,
        style: TextStyleConstant.subHeading2.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ), 
      centerTitle: centerTitle,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: SizedBox(
          height: 24,
          width: 24,
          child: Assets.images.arrowLeft.svg(),
        ),
      ),
      actions: actions,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: ColorsConstant.grey500,
          height: 1.0,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
