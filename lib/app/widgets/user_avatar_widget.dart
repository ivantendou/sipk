// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:sipk/app/constants/assets.gen.dart';

class UserAvatarWidget extends StatelessWidget {
  final String? imageUrl;

  const UserAvatarWidget({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? "",
        placeholder: (context, url) =>
            Assets.images.userPlaceholder.svg(width: 180),
        errorWidget: (context, url, error) =>
            Assets.images.userPlaceholder.svg(width: 180),
        fit: BoxFit.cover,
      ),
    );
  }
}
