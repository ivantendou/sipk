import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/admin_manage_user/controllers/admin_manage_user_controller.dart';
import 'package:sipk/app/modules/admin_manage_user/views/widgets/user_card_widget.dart';
import 'package:sipk/app/routes/app_pages.dart';
import 'package:sipk/models/users_model.dart';

class UserListViewWidget extends StatelessWidget {
  final AdminManageUserController controller;

  const UserListViewWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ColorsConstant.primary,
      onRefresh: () async {
        controller.pagingController.refresh();
      },
      child: PagedListView<int, UsersModel>(
        pagingController: controller.pagingController,
        padding: const EdgeInsets.symmetric(vertical: 8),
        builderDelegate: PagedChildBuilderDelegate<UsersModel>(
          itemBuilder: (context, user, index) {
            return Obx(() {
              final isSelected = controller.selectedUsers[user.id] ?? false;
              return UserCardWidget(
                name: user.fullName,
                role: user.role,
                userId: user.id!,
                isSelected: isSelected,
                isSelectionMode: controller.isSelectionMode.value,
                onTap: controller.isSelectionMode.value
                    ? () => controller.toggleSelection(user.id!)
                    : () {
                        Get.toNamed(
                          Routes.ADMIN_USER_DETAIL,
                          arguments: {'userId': user.id},
                        );
                      },
                onLongPress: () {
                  if (!controller.isSelectionMode.value) {
                    controller.toggleSelectionMode();
                    controller.toggleSelection(user.id!);
                  }
                },
                onCheckboxChanged: (value) {
                  controller.toggleSelection(user.id!);
                },
              );
            });
          },
          firstPageProgressIndicatorBuilder: (context) => Center(
            child: SizedBox(
              width: 48,
              child: LoadingIndicator(
                indicatorType: Indicator.ballBeat,
                strokeWidth: 4.0,
                colors: [Theme.of(context).primaryColor],
              ),
            ),
          ),
          newPageProgressIndicatorBuilder: (context) => Center(
            child: SizedBox(
              width: 48,
              child: LoadingIndicator(
                indicatorType: Indicator.ballBeat,
                strokeWidth: 4.0,
                colors: [Theme.of(context).primaryColor],
              ),
            ),
          ),
          noItemsFoundIndicatorBuilder: (context) => const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'No users found',
                style: TextStyleConstant.body,
              ),
            ),
          ),
          noMoreItemsIndicatorBuilder: (context) => const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'No more data',
                style: TextStyleConstant.caption,
              ),
            ),
          ),
          firstPageErrorIndicatorBuilder: (context) => Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Assets.images.errorImage.svg(width: 240),
                const SizedBox(height: 6),
                const Text(
                  'An error occurred',
                  style: TextStyleConstant.subHeading2,
                ),
                const SizedBox(height: 4),
                Text(
                  'Make sure your device is connected to the internet and try again.',
                  textAlign: TextAlign.center,
                  style: TextStyleConstant.body.copyWith(
                    color: ColorsConstant.grey700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
