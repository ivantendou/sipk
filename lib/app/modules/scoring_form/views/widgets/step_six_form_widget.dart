// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/scoring_form/controllers/scoring_form_controller.dart';
import 'package:sipk/app/widgets/dropdown_input_field_widget.dart';
import 'package:sipk/app/widgets/years_input_field_widget.dart';

class StepSixFormWidget extends StatelessWidget {
  final ScoringFormController controller;

  const StepSixFormWidget({
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
            'Data Tempat Tinggal',
            style: TextStyleConstant.subHeading2.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Kepemilikan Tempat Tanggal',
            hintText: 'Pilih jenis kepemilikan tempat tanggal...',
            items: const [
              'Sewa',
              'Milik Keluarga/Rumah Dinas',
              'Milik Sendiri (Angsuran KPR)',
              'Milik Sendiri',
            ],
            value: [
              'Sewa',
              'Milik Keluarga/Rumah Dinas',
              'Milik Sendiri (Angsuran KPR)',
              'Milik Sendiri'
            ].contains(controller.residenceOwnership.value)
                ? controller.residenceOwnership.value
                : null,
            onChanged: (value) {
              controller.residenceOwnership.value = value!;
            },
          ),
          const SizedBox(height: 16),
          YearsInputFieldWidget(
            controller: controller.residenceDurationController,
            fieldTitle: 'Lama Tinggal/Menetap',
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Reputasi di Lingkungan Tempat Tinggal',
            hintText: 'Pilih reputasi...',
            items: const [
              'Baik',
              'Tidak Baik',
              'Tidak Dikenal',
            ],
            value: ['Baik', 'Tidak Baik', 'Tidak Dikenal']
                    .contains(controller.neighborhoodReputation.value)
                ? controller.neighborhoodReputation.value
                : null,
            onChanged: (value) {
              controller.neighborhoodReputation.value = value!;
            },
          ),
          const SizedBox(height: 16),
        ],
      );
    });
  }
}
