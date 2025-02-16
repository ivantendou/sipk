// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/scoring_form/controllers/scoring_form_controller.dart';
import 'package:sipk/app/widgets/rupiah_input_field_widget.dart';

class StepThreeFormWidget extends StatelessWidget {
  final ScoringFormController controller;

  const StepThreeFormWidget({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Data Terkait Penghasilan',
          style: TextStyleConstant.subHeading2.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        RupiahInputFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Penghasilan Bersih (dari Gaji) Pemohon',
        ),
        const SizedBox(height: 16),
        RupiahInputFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Penghasilan Bersih (dari Gaji) Pasangan',
        ),
        const SizedBox(height: 16),
        const Text(
          'Apakah pemohon memiliki usaha mandiri?',
          style: TextStyleConstant.body,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio<String>(
                value: 'Ya',
                groupValue: controller.selectedOption.value,
                onChanged: (value) {
                  controller.setSelectedOption(value!);
                },
              ),
              const Text(
                'Ya',
                style: TextStyleConstant.body,
              ),
              const SizedBox(width: 20),
              Radio<String>(
                value: 'Tidak',
                groupValue: controller.selectedOption.value,
                onChanged: (value) {
                  controller.setSelectedOption(value!);
                },
              ),
              const Text(
                'Tidak',
                style: TextStyleConstant.body,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Obx(() {
          return controller.selectedOption == Rx<String>('Ya')
              ? Column(
                  children: [
                    RupiahInputFieldWidget(
                      controller: controller.sampleController,
                      fieldTitle: 'Penghasilan Bersih (dari Usaha) Pemohon',
                    ),
                    const SizedBox(height: 16),
                    RupiahInputFieldWidget(
                      controller: controller.sampleController,
                      fieldTitle: 'Penghasilan Bersih (dari Usaha) Pasangan',
                    ),
                  ],
                )
              : const SizedBox();
        }),
        const SizedBox(height: 16),
        Text(
          'Data Terkait Pengeluaran',
          style: TextStyleConstant.subHeading2.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        RupiahInputFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Biaya Konsumsi Rumah Tangga',
        ),
        const SizedBox(height: 16),
        RupiahInputFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Biaya Transportasi',
        ),
        const SizedBox(height: 16),
        RupiahInputFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Biaya Komunikasi',
        ),
        const SizedBox(height: 16),
        RupiahInputFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Biaya Pendidikan',
        ),
        const SizedBox(height: 16),
        RupiahInputFieldWidget(
          controller: controller.sampleController,
          fieldTitle:
              'Tagihan Rekening Rumah - Listrik, Air, Sewa, Internet, dll',
        ),
        const SizedBox(height: 16),
        RupiahInputFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Jumlah Angsuran Berjalan',
        ),
        const SizedBox(height: 16),
        RupiahInputFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Biaya Hiburan dan Sosial',
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
