import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/ao_select_scoring/controllers/ao_select_scoring_controller.dart';
import 'package:sipk/app/widgets/custom_button_widget.dart';

void showFilterBottomSheet(
    BuildContext context, AoSelectScoringController controller) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Obx(() {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filter Scoring Data',
                  style: TextStyleConstant.subHeading
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () => controller.resetFilters(),
                  child: Text(
                    'Reset',
                    style: TextStyleConstant.body.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorsConstant.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Sort by',
              style: TextStyleConstant.subHeading2
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: const Text(
                'Newest',
                style: TextStyleConstant.body,
              ),
              leading: Radio<String>(
                value: 'terbaru',
                groupValue: controller.selectedSortOption.value,
                onChanged: (value) {
                  controller.changeSortOption(value!);
                },
                activeColor: ColorsConstant.primary,
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
              ),
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              onTap: () {
                controller.changeSortOption('terbaru');
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: const Text(
                'Oldest',
                style: TextStyleConstant.body,
              ),
              leading: Radio<String>(
                value: 'terlama',
                groupValue: controller.selectedSortOption.value,
                onChanged: (value) {
                  controller.changeSortOption(value!);
                },
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                activeColor: ColorsConstant.primary,
              ),
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              onTap: () {
                controller.changeSortOption('terlama');
              },
            ),
            const SizedBox(height: 16),
            CustomButtonWidget(
              text: 'Apply',
              width: double.infinity,
              onTap: () {
                controller.applyFilters();
                Get.back();
              },
            ),
          ],
        );
      }),
    ),
  );
}
