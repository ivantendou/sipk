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
      if (controller.hasBusiness == Rx<String>('Ya')) {
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
              controller: controller.salesController,
              fieldTitle: 'Penjualan/Omzet',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.cogsController,
              fieldTitle: 'Harga Pokok Pembelian',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.dailyLaborController,
              fieldTitle: 'Biaya Tenaga Kerja Harian',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.consumptionController,
              fieldTitle: 'Biaya Konsumsi',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.transportCostController,
              fieldTitle: 'Biaya Transportasi Usaha',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.fuelController,
              fieldTitle: 'Biaya Bahan Bakar',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.packagingController,
              fieldTitle: 'Biaya Kemasan',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.depreciationController,
              fieldTitle: 'Biaya Susut/Rusak/Tidak Laku',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.otherCostsController,
              fieldTitle: 'Biaya Lainnya',
            ),
            const SizedBox(height: 16),
            DayInputFieldWidget(
              controller: controller.activeDaysController,
              fieldTitle: 'Jumlah Hari Aktif Usaha',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.monthlyLaborController,
              fieldTitle: 'Biaya Tenaga Kerja Bulanan',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.rentalController,
              fieldTitle: 'Biaya Sewa',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.assetMaintenanceController,
              fieldTitle: 'Biaya Pemeliharaan Aset Usaha',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.utilitiesController,
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
