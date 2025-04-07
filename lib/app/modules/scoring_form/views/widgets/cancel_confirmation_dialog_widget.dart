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
              text: 'Apakah Anda ingin mengakhiri proses skoring ini? '),
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
      text: 'Tidak',
      width: 120,
      onTap: () {
        Get.back();
      },
    ),
    cancel: Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: CustomButtonWidget(
        text: 'Ya',
        width: 120,
        onTap: () {
          Get.back();
          Get.back();
        },
        buttonColor: ColorsConstant.white,
        borderColor: ColorsConstant.primary,
        textColor: ColorsConstant.primary,
      ),
    ),
  );
}
