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
              'Independent Business Details',
              style: TextStyleConstant.subHeading2.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.salesController,
              fieldTitle: 'Sales/Turnover',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.cogsController,
              fieldTitle: 'Cost of Goods Sold',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.dailyLaborController,
              fieldTitle: 'Daily Labor Costs',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.consumptionController,
              fieldTitle: 'Consumption Costs',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.transportCostController,
              fieldTitle: 'Business Transportation Costs',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.fuelController,
              fieldTitle: 'Fuel Costs',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.packagingController,
              fieldTitle: 'Packaging Costs',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.depreciationController,
              fieldTitle: 'Depreciation/Damage/Unsold Costs',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.otherCostsController,
              fieldTitle: 'Other Costs',
            ),
            const SizedBox(height: 16),
            DayInputFieldWidget(
              controller: controller.activeDaysController,
              fieldTitle: 'Number of Active Business Days',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.monthlyLaborController,
              fieldTitle: 'Monthly Labor Costs',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.rentalController,
              fieldTitle: 'Rental Costs',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.assetMaintenanceController,
              fieldTitle: 'Business Asset Maintenance Costs',
            ),
            const SizedBox(height: 16),
            RupiahInputFieldWidget(
              controller: controller.utilitiesController,
              fieldTitle: 'Water-Electricity-Phone Bills',
            ),
            const SizedBox(height: 16),
          ],
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Independent Business Details',
              style: TextStyleConstant.subHeading2.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'The applicant does not have an independent business. Click Next.',
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
