// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/scoring_form/controllers/scoring_form_controller.dart';
import 'package:sipk/app/widgets/dropdown_input_field_widget.dart';

class StepEightFormWidget extends StatelessWidget {
  final ScoringFormController controller;

  const StepEightFormWidget({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Data Jaminan/Agunan',
            style: TextStyleConstant.subHeading2.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Coverage atas Permohonan',
            hintText: 'Pilih coverage atas permohonan...',
            items: const [
              '< 100%',
              '125% <= 100%',
              '150% <= 125%',
              '>= 150%',
            ],
            value: controller.applicationCoverage.value,
            onChanged: (value) {
              controller.applicationCoverage.value = value!;
            },
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Asuransi Jaminan Kendaraan',
            hintText: 'Pilih jaminan kendaraan...',
            items: const [
              'Ada Asuransi',
              'Tidak Ada Asuransi',
            ],
            value: controller.vehicleCollateralInsurance.value,
            onChanged: (value) {
              controller.vehicleCollateralInsurance.value = value!;
            },
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Asuransi Jiwa Pemohon',
            hintText: 'Pilih asuransi jiwa pemohon...',
            items: const [
              'Ada Asuransi',
              'Tidak Ada Asuransi',
            ],
            value: controller.applicantLifeInsurance.value,
            onChanged: (value) {
              controller.applicantLifeInsurance.value = value!;
            },
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Pengikatan Agunan',
            hintText: 'Pilih pengikatan agunan...',
            items: const [
              'Notaril',
              'Tidak Notaril',
            ],
            value: controller.collateralBinding.value,
            onChanged: (value) {
              controller.collateralBinding.value = value!;
            },
          ),
          const SizedBox(height: 16),
        ],
      );
    });
  }
}
