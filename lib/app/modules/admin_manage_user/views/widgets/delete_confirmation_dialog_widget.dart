import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/admin_manage_user/controllers/admin_manage_user_controller.dart';
import 'package:sipk/app/widgets/custom_button_widget.dart';

void showDeleteConfirmationDialog(AdminManageUserController controller) {
  Get.defaultDialog(
    title: 'Konfirmasi Penghapusan',
    titleStyle: TextStyleConstant.subHeading.copyWith(
      fontWeight: FontWeight.bold,
    ),
    titlePadding: const EdgeInsets.only(top: 16),
    content: Text(
      'Apakah Anda yakin ingin menghapus ${controller.selectedCount} pengguna? Tindakan ini tidak dapat dibatalkan.',
      style: TextStyleConstant.body,
      textAlign: TextAlign.center,
    ),
    contentPadding: const EdgeInsets.all(16),
    confirm: CustomButtonWidget(
      text: 'Hapus',
      width: 120,
      onTap: () {
        Get.back();
        controller.deleteSelectedUsers();
      },
    ),
    cancel: Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomButtonWidget(
        text: 'Batal',
        width: 120,
        onTap: () => Get.back(),
        buttonColor: ColorsConstant.white,
        borderColor: ColorsConstant.primary,
        textColor: ColorsConstant.primary,
      ),
    ),
  );
}
