import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class UserCardWidget extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final String? role;
  final String userId;
  final bool isSelected;
  final bool isSelectionMode;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final void Function(bool?)? onCheckboxChanged;

  const UserCardWidget({
    Key? key,
    this.imageUrl,
    this.name,
    this.role,
    required this.userId,
    required this.isSelected,
    required this.isSelectionMode,
    this.onTap,
    this.onLongPress,
    this.onCheckboxChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        width: double.infinity,
        child: Row(
          children: [
            if (isSelectionMode)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                    value: isSelected,
                    onChanged: onCheckboxChanged,
                    activeColor: ColorsConstant.primary,
                  ),
                ),
              ),
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
            Expanded(
              child: Column(
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
            ),
          ],
        ),
      ),
    );
  }
}