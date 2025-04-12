import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/submission_data/controllers/submission_data_controller.dart';
import 'package:sipk/app/widgets/custom_button_widget.dart';

void showFilterBottomSheet(
    BuildContext context, SubmissionDataController controller) {
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
                  'Filter Data Skoring',
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
              'Urutkan Berdasarkan',
              style: TextStyleConstant.subHeading2
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: const Text(
                'Terbaru',
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
                'Terlama',
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
            Text(
              'Status Pengajuan',
              style: TextStyleConstant.subHeading2
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            ListTile(
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              contentPadding: const EdgeInsets.all(0),
              title: const Text('Diproses', style: TextStyleConstant.body),
              leading: Radio<String>(
                value: 'Pending',
                groupValue: controller.selectedApplicationStatus.value,
                onChanged: (value) => controller.changeStatusOption(value!),
                activeColor: ColorsConstant.primary,
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
              ),
              onTap: () => controller.changeStatusOption('Pending'),
            ),
            ListTile(
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              contentPadding: const EdgeInsets.all(0),
              title: const Text('Diterima', style: TextStyleConstant.body),
              leading: Radio<String>(
                value: 'Accepted',
                groupValue: controller.selectedApplicationStatus.value,
                onChanged: (value) => controller.changeStatusOption(value!),
                activeColor: ColorsConstant.primary,
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
              ),
              onTap: () => controller.changeStatusOption('Accepted'),
            ),
            ListTile(
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              contentPadding: const EdgeInsets.all(0),
              title: const Text('Ditolak', style: TextStyleConstant.body),
              leading: Radio<String>(
                value: 'Rejected',
                groupValue: controller.selectedApplicationStatus.value,
                onChanged: (value) => controller.changeStatusOption(value!),
                activeColor: ColorsConstant.primary,
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
              ),
              onTap: () => controller.changeStatusOption('Rejected'),
            ),
            const SizedBox(height: 16),
            CustomButtonWidget(
              text: 'Terapkan',
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