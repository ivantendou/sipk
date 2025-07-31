import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/admin_manage_user/controllers/admin_manage_user_controller.dart';
import 'package:sipk/app/modules/admin_manage_user/views/widgets/delete_confirmation_dialog_widget.dart';

AppBar buildSelectionAppBar(AdminManageUserController controller) {
    return AppBar(
      title: Text(
        '${controller.selectedCount} selected',
        style: TextStyleConstant.subHeading2,
      ),
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => controller.toggleSelectionMode(),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.select_all),
          onPressed: () => controller.selectAll(),
        ),
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            if (controller.selectedCount > 0) {
              showDeleteConfirmationDialog(controller);
            } else {
              Get.snackbar(
                'Info',
                'Pilih setidaknya satu pengguna untuk dihapus',
                backgroundColor: Colors.amber,
                colorText: Colors.black,
              );
            }
          },
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: ColorsConstant.grey500,
          height: 1.0,
        ),
      ),
    );
  }