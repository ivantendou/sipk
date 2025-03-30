// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Data Permohonan',
          style: TextStyleConstant.subHeading2.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        DropdownInputFieldWidget(
          fieldTitle: 'Jenis Pembiayaan',
          hintText: 'Pilih jenis pembiayaan...',
          items: const [
            'Modal Kerja',
            'Investasi Usaha',
            'Investasi Rumah Tangga',
            'Konsumer',
          ],
          value: controller.financingType.value,
          onChanged: (value) {
            controller.financingType.value = value!;
          },
        ),
        const SizedBox(height: 16),
        DropdownInputFieldWidget(
          fieldTitle: 'Pembiayaan ke-',
          hintText: 'Pilih pembiayaan ke-...',
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
          value: controller.financingIteration.value,
          onChanged: (value) {
            controller.financingIteration.value = (value == '>10') ? '11' : value!;
          },
        ),
        const SizedBox(height: 16),
        RupiahInputFieldWidget(
          controller: controller.applicationAmountController,
          fieldTitle: 'Jumlah Pengajuan/Harga Barang (Rupiah)',
        ),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          controller: controller.allocationController,
          fieldTitle: 'Peruntukan',
          validator: FormValidators.validateName,
        ),
        const SizedBox(height: 16),
        PercentInputFieldWidget(
          controller: controller.downPaymentPctController,
          fieldTitle: 'Uang Muka (%)',
        ),
        const SizedBox(height: 16),
        RupiahInputFieldWidget(
          controller: controller.downPaymentAmtController,
          fieldTitle: 'Uang Muka (Rupiah)',
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
