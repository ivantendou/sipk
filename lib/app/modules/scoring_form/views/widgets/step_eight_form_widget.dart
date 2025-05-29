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
            'Collateral Data',
            style: TextStyleConstant.subHeading2.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Coverage of Application',
            hintText: 'Select coverage of application...',
            items: const [
              '< 100%',
              '125% <= 100%',
              '150% <= 125%',
              '>= 150%',
            ],
            value: ['< 100%', '125% <= 100%', '150% <= 125%', '>= 150%']
                    .contains(controller.applicationCoverage.value)
                ? controller.applicationCoverage.value
                : null,
            onChanged: (value) {
              controller.applicationCoverage.value = value!;
            },
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Vehicle Collateral Insurance',
            hintText: 'Select...',
            items: const [
              'Ada Asuransi',
              'Tidak Ada Asuransi',
            ],
            value: ['Ada Asuransi', 'Tidak Ada Asuransi']
                    .contains(controller.vehicleCollateralInsurance.value)
                ? controller.vehicleCollateralInsurance.value
                : null,
            onChanged: (value) {
              controller.vehicleCollateralInsurance.value = value!;
            },
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Applicant Life Insurance',
            hintText: 'Select...',
            items: const [
              'Ada Asuransi',
              'Tidak Ada Asuransi',
            ],
            value: ['Ada Asuransi', 'Tidak Ada Asuransi']
                    .contains(controller.applicantLifeInsurance.value)
                ? controller.applicantLifeInsurance.value
                : null,
            onChanged: (value) {
              controller.applicantLifeInsurance.value = value!;
            },
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Collateral Binding',
            hintText: 'Select collateral binding...',
            items: const [
              'Notaril',
              'Tidak Notaril',
            ],
            value: ['Notaril', 'Tidak Notaril']
                    .contains(controller.collateralBinding.value)
                ? controller.collateralBinding.value
                : null,
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
