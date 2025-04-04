import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/scoring_form/controllers/scoring_form_controller.dart';
import 'package:sipk/app/widgets/custom_button_widget.dart';

void showCancelConfirmationDialog(ScoringFormController controller) {
  Get.defaultDialog(
    title: 'Konfirmasi Pembatalan',
    titleStyle: TextStyleConstant.subHeading.copyWith(
      fontWeight: FontWeight.bold,
    ),
    titlePadding: const EdgeInsets.only(top: 16),
    content: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyleConstant.body.copyWith(color: Colors.black),
        children: [
          const TextSpan(
              text: 'Apakah Anda ingin menyimpan draf skoring ini? '),
          TextSpan(
            text:
                'Hanya data pada tahap yang telah selesai yang akan disimpan.',
            style: TextStyleConstant.body.copyWith(
              color: ColorsConstant.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
    contentPadding: const EdgeInsets.all(16),
    confirm: CustomButtonWidget(
      text: 'Simpan',
      width: 120,
      onTap: () {
        if (controller.currentIndex.value == 0) {
          controller.deleteForm();
        }
        Get.back();
      },
    ),
    cancel: Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: CustomButtonWidget(
        text: 'Hapus',
        width: 120,
        onTap: () {
          controller.deleteForm();
          Get.back();
        },
        buttonColor: ColorsConstant.white,
        borderColor: ColorsConstant.primary,
        textColor: ColorsConstant.primary,
      ),
    ),
  );
}
