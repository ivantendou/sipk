import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sipk/app/constants/assets.gen.dart';

class UserAvatarEditWidget extends StatelessWidget {
  final String? imageUrl;
  final VoidCallback? onEdit;

  const UserAvatarEditWidget({
    Key? key,
    this.imageUrl,
    this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipOval(
          child: CachedNetworkImage(
            imageUrl: imageUrl ?? "",
            height: 180,
            width: 180,
            placeholder: (context, url) =>
                Assets.images.userPlaceholder.svg(width: 180),
            errorWidget: (context, url, error) =>
                Assets.images.userPlaceholder.svg(width: 180),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 12,
          right: 12,
          child: GestureDetector(
            onTap: onEdit,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withValues(alpha: 0.6),
              ),
              child: const Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
