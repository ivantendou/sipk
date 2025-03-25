import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/profile/controllers/ao_profile_controller.dart';
import 'package:sipk/app/widgets/custom_button_widget.dart';

void showLogoutConfirmationDialog(ProfileController controller) {
  Get.defaultDialog(
    title: 'Konfirmasi Logout',
    titleStyle: TextStyleConstant.subHeading.copyWith(
      fontWeight: FontWeight.bold,
    ),
    titlePadding: const EdgeInsets.only(top: 16),
    content: const Text(
      'Apakah Anda yakin ingin keluar?',
      style: TextStyleConstant.body,
      textAlign: TextAlign.center,
    ),
    contentPadding: const EdgeInsets.all(16),
    confirm: CustomButtonWidget(
      text: 'Keluar',
      width: 120,
      onTap: () {
        Get.back();
        controller.logout();
      },
    ),
    cancel: Padding(
      padding: const EdgeInsets.only(bottom: 4),
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
