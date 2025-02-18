// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';

import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/scoring_form/controllers/scoring_form_controller.dart';
import 'package:sipk/app/widgets/day_input_field_widget.dart';
import 'package:sipk/app/widgets/rupiah_input_field_widget.dart';

class StepFiveFormWidget extends StatelessWidget {
  final ScoringFormController controller;

  const StepFiveFormWidget({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.selectedOption == Rx<String>('Ya')) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data Rincian Usaha Mandiri',
              style: TextStyleConstant.subHeading2.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.sampleController,
              fieldTitle: 'Penjualan/Omzet',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.sampleController,
              fieldTitle: 'Harga Pokok Pembelian',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.sampleController,
              fieldTitle: 'Biaya Tenaga Kerja Harian',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.sampleController,
              fieldTitle: 'Biaya Konsumsi',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.sampleController,
              fieldTitle: 'Biaya Transportasi Usaha',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.sampleController,
              fieldTitle: 'Biaya Bahan Bakar',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.sampleController,
              fieldTitle: 'Biaya Kemasan',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.sampleController,
              fieldTitle: 'Biaya Susut/Rusak/Tidak Laku',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.sampleController,
              fieldTitle: 'Biaya Lainnya',
            ),
            const SizedBox(height: 16),
            DayInputFieldWidget(
              controller: controller.sampleController,
              fieldTitle: 'Jumlah Hari Aktif Usaha',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.sampleController,
              fieldTitle: 'Biaya Tenaga Kerja Bulanan',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.sampleController,
              fieldTitle: 'Biaya Sewa',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.sampleController,
              fieldTitle: 'Biaya Pemeliharaan Aset Usaha',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.sampleController,
              fieldTitle: 'Biaya Rekening Air-Listrik-Telp.',
            ),
            const SizedBox(height: 16),
          ],
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data Rincian Usaha Mandiri',
              style: TextStyleConstant.subHeading2.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Pemohon tidak memiliki usaha mandiri. Klik selanjutnya.',
              style: TextStyleConstant.body.copyWith(
                color: ColorsConstant.grey900,
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      }
    });
  }
}
