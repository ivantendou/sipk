// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/scoring_form/controllers/scoring_form_controller.dart';
import 'package:sipk/app/utils/form_validators.dart';
import 'package:sipk/app/widgets/dropdown_input_field_widget.dart';
import 'package:sipk/app/widgets/percent_input_field_widget.dart';
import 'package:sipk/app/widgets/rupiah_input_field_widget.dart';
import 'package:sipk/app/widgets/text_form_field_widget.dart';

class StepTwoFormWidget extends StatelessWidget {
  final ScoringFormController controller;

  const StepTwoFormWidget({
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
            'Application Data',
            style: TextStyleConstant.subHeading2.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Financing Type',
            hintText: 'Select financing type...',
            items: const [
              'Modal Kerja',
              'Investasi Usaha',
              'Investasi Rumah Tangga',
              'Konsumer',
            ],
            value: [
              'Modal Kerja',
              'Investasi Usaha',
              'Investasi Rumah Tangga',
              'Konsumer'
            ].contains(controller.financingType.value)
                ? controller.financingType.value
                : null,
            onChanged: (value) {
              controller.financingType.value = value!;
            },
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Financing Number',
            hintText: 'Select financing number...',
            items: const [
              '1',
              '2',
              '3',
              '4',
              '5',
              '6',
              '7',
              '8',
              '9',
              '10',
              '>10',
            ],
            value: [
              '1',
              '2',
              '3',
              '4',
              '5',
              '6',
              '7',
              '8',
              '9',
              '10',
              '>10',
            ].contains(controller.financingIteration.value)
                ? controller.financingIteration.value
                : null,
            onChanged: (value) {
              controller.financingIteration.value = value!;
            },
          ),
          const SizedBox(height: 16),
          RupiahInputFieldWidget(
            controller: controller.applicationAmountController,
            fieldTitle: 'Application Amount/Goods Price (Rupiah)',
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.allocationController,
            fieldTitle: 'Purpose/Allocation',
            validator: FormValidators.validateName,
          ),
          const SizedBox(height: 16),
          PercentInputFieldWidget(
            controller: controller.downPaymentPctController,
            fieldTitle: 'Down Payment (%)',
          ),
          const SizedBox(height: 16),
        ],
      );
    });
  }
}
