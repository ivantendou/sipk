// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/scoring_form/controllers/scoring_form_controller.dart';
import 'package:sipk/app/widgets/dropdown_input_field_widget.dart';

class StepSevenFormWidget extends StatelessWidget {
  final ScoringFormController controller;

  const StepSevenFormWidget({
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
            'Banking Relationship Information',
            style: TextStyleConstant.subHeading2.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Banking Relationship',
            hintText: 'Select banking relationship...',
            items: const [
              'Belum Pernah',
              'Debitur Bank < 1 Tahun',
              'Debitur Bank 1 < 3 Tahun',
              'Debitur Bank > 3 Tahun',
            ],
            value: [
              'Belum Pernah',
              'Debitur Bank < 1 Tahun',
              'Debitur Bank 1 < 3 Tahun',
              'Debitur Bank > 3 Tahun'
            ].contains(controller.bankingRelationship.value)
                ? controller.bankingRelationship.value
                : null,
            onChanged: (value) {
              controller.bankingRelationship.value = value!;
            },
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Average Monthly Savings Balance',
            hintText: 'Pilih average monthly savings balance...',
            items: const ['Tidak Ada', '< 5 Juta', '5 < 10 Juta', '> 10 Juta'],
            value: ['Tidak Ada', '< 5 Juta', '5 < 10 Juta', '> 10 Juta']
                    .contains(controller.averageMonthlyBalance.value)
                ? controller.averageMonthlyBalance.value
                : null,
            onChanged: (value) {
              controller.averageMonthlyBalance.value = value!;
            },
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Average Savings Transaction Frequency',
            hintText: 'Pilih average savings transaction frequency...',
            items: const [
              'Tidak Ada',
              '< 3 kali per-bulan',
              '3 > 8 kali per-bulan',
              '> 8 kali per-bulan',
            ],
            value: [
              'Tidak Ada',
              '< 3 kali per-bulan',
              '3 > 8 kali per-bulan',
              '> 8 kali per-bulan'
            ].contains(controller.averageTransactionFrequency.value)
                ? controller.averageTransactionFrequency.value
                : null,
            onChanged: (value) {
              controller.averageTransactionFrequency.value = value!;
            },
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Applicant\'s Credit Quality (SLIK)',
            hintText: 'Select applicant credit quality...',
            items: const [
              'Koll 3 s.d. 5',
              'Koll 2',
              'Koll 1',
              'Belum Ada Riwayat Kredit',
            ],
            value: [
              'Koll 3 s.d. 5',
              'Koll 2',
              'Koll 1',
              'Belum Ada Riwayat Kredit'
            ].contains(controller.applicantCreditQuality.value)
                ? controller.applicantCreditQuality.value
                : null,
            onChanged: (value) {
              controller.applicantCreditQuality.value = value!;
            },
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Applicant\'s PT CLIK Rating',
            hintText: 'Select applicant\'s CLIK rating...',
            items: const [
              'A - B (Very High Risk)',
              'C - D (High Risk)',
              'E - F (Medium Risk)',
              'G - H (Low Risk)',
              'I - J (Very Low Risk)',
            ],
            value: [
              'A - B (Very High Risk)',
              'C - D (High Risk)',
              'E - F (Medium Risk)',
              'G - H (Low Risk)',
              'I - J (Very Low Risk)'
            ].contains(controller.applicantCreditRating.value)
                ? controller.applicantCreditRating.value
                : null,
            onChanged: (value) {
              controller.applicantCreditRating.value = value!;
            },
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Spouse\'s PT CLIK Rating',
            hintText: 'Select spouse\'s CLIK rating...',
            items: const [
              'Tidak Ada',
              'A - B (Very High Risk)',
              'C - D (High Risk)',
              'E - F (Medium Risk)',
              'G - H (Low Risk)',
              'I - J (Very Low Risk)',
            ],
            value: [
              'Tidak Ada',
              'A - B (Very High Risk)',
              'C - D (High Risk)',
              'E - F (Medium Risk)',
              'G - H (Low Risk)',
              'I - J (Very Low Risk)'
            ].contains(controller.spouseCreditRating.value)
                ? controller.spouseCreditRating.value
                : null,
            onChanged: (value) {
              controller.spouseCreditRating.value = value!;
            },
          ),
          const SizedBox(height: 16),
        ],
      );
    });
  }
}
