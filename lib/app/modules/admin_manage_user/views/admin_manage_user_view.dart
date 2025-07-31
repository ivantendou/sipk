import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/admin_manage_user/views/widgets/search_app_bar_widget.dart';
import 'package:sipk/app/modules/admin_manage_user/views/widgets/selection_app_bar_widget.dart';
import 'package:sipk/app/modules/admin_manage_user/views/widgets/user_list_view_widget.dart';
import 'package:sipk/app/routes/app_pages.dart';

import '../controllers/admin_manage_user_controller.dart';

class AdminManageUserView extends GetView<AdminManageUserController> {
  const AdminManageUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: controller.isSelectionMode.value
            ? buildSelectionAppBar(controller)
            : buildRegularAppBar(context, controller),
        backgroundColor: ColorsConstant.grey100,
        body: UserListViewWidget(controller: controller),
        floatingActionButton: controller.isSelectionMode.value
            ? null
            : FloatingActionButton(
                onPressed: () {
                  Get.toNamed(Routes.ADMIN_USER_ADD);
                },
                backgroundColor: ColorsConstant.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Assets.images.plus.svg(),
              ),
      );
    });
  }
}
