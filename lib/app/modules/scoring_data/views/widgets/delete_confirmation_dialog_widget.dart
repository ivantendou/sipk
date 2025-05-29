import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/scoring_data/controllers/scoring_data_controller.dart';
import 'package:sipk/app/widgets/custom_button_widget.dart';

void showDeleteConfirmationDialog(ScoringDataController controller) {
  Get.defaultDialog(
    title: 'Delete Confirmation',
    titleStyle: TextStyleConstant.subHeading.copyWith(
      fontWeight: FontWeight.bold,
    ),
    titlePadding: const EdgeInsets.only(top: 16),
    content: const Text(
      'Are you sure you want to delete the selected data? This action cannot be undone.',
      style: TextStyleConstant.body,
      textAlign: TextAlign.center,
    ),
    contentPadding: const EdgeInsets.all(16),
    confirm: CustomButtonWidget(
      text: 'Delete',
      width: 120,
      onTap: () {
        Get.back();
        controller.deleteSelectedData();
      },
    ),
    cancel: Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomButtonWidget(
        text: 'Cancel',
        width: 120,
        onTap: () => Get.back(),
        buttonColor: ColorsConstant.white,
        borderColor: ColorsConstant.primary,
        textColor: ColorsConstant.primary,
      ),
    ),
  );
}
