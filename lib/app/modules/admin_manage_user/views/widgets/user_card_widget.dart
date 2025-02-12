import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class UserCardWidget extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final String? role;

  const UserCardWidget ({
    Key? key,
    this.imageUrl,
    this.name,
    this.role,
  }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: imageUrl ?? "",
              height: 48,
              width: 48,
              placeholder: (context, url) =>
                  Assets.images.userPlaceholder.svg(width: 48),
              errorWidget: (context, url, error) =>
                  Assets.images.userPlaceholder.svg(width: 48),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name ?? "",
                style: TextStyleConstant.body.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                role ?? "",
                style: TextStyleConstant.body,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
