// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/scoring_form/controllers/scoring_form_controller.dart';
import 'package:sipk/app/widgets/dropdown_input_field_widget.dart';
import 'package:sipk/app/widgets/month_input_field_widget.dart';
import 'package:sipk/app/widgets/percent_input_field_widget.dart';
import 'package:sipk/app/widgets/rupiah_input_field_widget.dart';

class StepThreeFormWidget extends StatelessWidget {
  final ScoringFormController controller;

  const StepThreeFormWidget({
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
            'Income-Related Data',
            style: TextStyleConstant.subHeading2.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          RupiahInputFieldWidget(
            controller: controller.netSalaryApplicantController,
            fieldTitle: 'Applicant\'s Net Salary Income',
          ),
          const SizedBox(height: 16),
          RupiahInputFieldWidget(
            controller: controller.netSalarySpouseController,
            fieldTitle: 'Spouse\'s Net Salary Income',
          ),
          const SizedBox(height: 16),
          const Text(
            'Does the applicant have a self-owned business?',
            style: TextStyleConstant.body,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio<String>(
                value: 'Ya',
                groupValue: controller.hasBusiness.value,
                onChanged: (value) {
                  controller.setHasBusiness(value!);
                },
              ),
              const Text(
                'Yes',
                style: TextStyleConstant.body,
              ),
              const SizedBox(width: 20),
              Radio<String>(
                value: 'Tidak',
                groupValue: controller.hasBusiness.value,
                onChanged: (value) {
                  controller.setHasBusiness(value!);
                },
              ),
              const Text(
                'No',
                style: TextStyleConstant.body,
              ),
            ],
          ),
          const SizedBox(height: 16),
          controller.hasBusiness == Rx<String>('Ya')
              ? Column(
                  children: [
                    RupiahInputFieldWidget(
                      controller:
                          controller.netBusinessIncomeApplicantController,
                      fieldTitle: 'Applicant\'s Net Business Income',
                    ),
                    const SizedBox(height: 16),
                    RupiahInputFieldWidget(
                      controller: controller.netBusinessIncomeSpouseController,
                      fieldTitle: 'Spouse\'s Net Business Income',
                    ),
                  ],
                )
              : const SizedBox(),
          const SizedBox(height: 16),
          Text(
            'Expense-Related Data',
            style: TextStyleConstant.subHeading2.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          RupiahInputFieldWidget(
            controller: controller.householdExpenseController,
            fieldTitle: 'Household Consumption Expenses',
          ),
          const SizedBox(height: 16),
          RupiahInputFieldWidget(
            controller: controller.transportationExpenseController,
            fieldTitle: 'Transportation Expenses',
          ),
          const SizedBox(height: 16),
          RupiahInputFieldWidget(
            controller: controller.communicationExpenseController,
            fieldTitle: 'Communication Expenses',
          ),
          const SizedBox(height: 16),
          RupiahInputFieldWidget(
            controller: controller.educationExpenseController,
            fieldTitle: 'Education Expenses',
          ),
          const SizedBox(height: 16),
          RupiahInputFieldWidget(
            controller: controller.utilityBillsController,
            fieldTitle:
                'Househol Bills',
          ),
          const SizedBox(height: 16),
          RupiahInputFieldWidget(
            controller: controller.ongoingInstallmentController,
            fieldTitle: 'Current Installment Amount',
          ),
          const SizedBox(height: 16),
          RupiahInputFieldWidget(
            controller: controller.entertainmentExpenseController,
            fieldTitle: 'Entertainment and Social Expenses',
          ),
          const SizedBox(height: 16),
          MonthInputFieldWidget(
            controller: controller.financingTermController,
            fieldTitle: 'Financing Term',
            isFinancingTerm: true,
          ),
          const SizedBox(height: 16),
          PercentInputFieldWidget(
            controller: controller.ekvRateController,
            fieldTitle: 'Equivalent Rate Margin Per-Month',
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Installment Type',
            hintText: 'Select installment type...',
            items: const [
              'Flat',
              'Anuitas',
            ],
            value:
                ['Flat', 'Anuitas'].contains(controller.installmentType.value)
                    ? controller.installmentType.value
                    : null,
            onChanged: (value) {
              controller.installmentType.value = value!;
            },
          ),
          const SizedBox(height: 16),
        ],
      );
    });
  }
}
