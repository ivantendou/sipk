import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:badges/badges.dart' as badges;

class AoHomeAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String? imageUrl;
  final String? name;

  const AoHomeAppbarWidget({
    Key? key,
    this.imageUrl,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      title: Row(
        children: [
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: imageUrl ?? "",
              height: 32,
              width: 32,
              placeholder: (context, url) =>
                  Assets.images.userPlaceholder.svg(width: 32),
              errorWidget: (context, url, error) =>
                  Assets.images.userPlaceholder.svg(width: 32),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          RichText(
            text: TextSpan(
              style: TextStyleConstant.body,
              children: [
                const TextSpan(
                  text: "Halo, ",
                ),
                TextSpan(
                  text: name,
                  style: TextStyleConstant.body
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: ColorsConstant.grey500,
          height: 1.0,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 0),
          child: Stack(
            children: [
              IconButton(
                onPressed: () {
                  Get.toNamed('/notification');
                },
                icon: Assets.images.bell.svg(width: 24),
              ),
              const Positioned(
                right: 15,
                top: 10,
                child: badges.Badge(
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: Colors.red,
                    padding: EdgeInsets.all(4),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
