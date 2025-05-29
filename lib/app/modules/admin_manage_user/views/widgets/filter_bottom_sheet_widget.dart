import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/admin_manage_user/controllers/admin_manage_user_controller.dart';
import 'package:sipk/app/widgets/custom_button_widget.dart';

void showFilterBottomSheet(
    BuildContext context, AdminManageUserController controller) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Obx(
        () {
          return Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filter User',
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
              ListTile(
                title: const Text(
                  'Account Officer',
                  style: TextStyleConstant.body,
                ),
                contentPadding: const EdgeInsets.all(0),
                trailing: SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: controller.selectedRoles['Account Officer'] ?? false,
                    onChanged: (value) =>
                        controller.toggleRole('Account Officer'),
                    activeColor: ColorsConstant.primary,
                  ),
                ),
                onTap: () => controller.toggleRole('Account Officer'),
              ),
              ListTile(
                title: const Text(
                  'Manajer',
                  style: TextStyleConstant.body,
                ),
                contentPadding: const EdgeInsets.all(0),
                trailing: SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: controller.selectedRoles['Manajer'] ?? false,
                    onChanged: (value) => controller.toggleRole('Manajer'),
                    activeColor: ColorsConstant.primary,
                  ),
                ),
                onTap: () => controller.toggleRole('Manajer'),
              ),
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
        },
      ),
    ),
  );
}
