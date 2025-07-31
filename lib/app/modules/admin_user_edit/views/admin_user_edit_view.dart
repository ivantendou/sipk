import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/admin_user_edit/controllers/admin_user_edit_controller.dart';
import 'package:sipk/app/modules/admin_user_edit/views/widgets/user_avatar_edit_widget.dart';
import 'package:sipk/app/utils/form_validators.dart';
import 'package:sipk/app/widgets/custom_app_bar_widget.dart';
import 'package:sipk/app/widgets/dropdown_input_field_widget.dart';
import 'package:sipk/app/widgets/form_button_widget.dart';
import 'package:sipk/app/widgets/text_form_field_widget.dart';

class AdminUserEditView extends GetView<AdminUserEditController> {
  const AdminUserEditView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: 'Edit User'),
      backgroundColor: ColorsConstant.grey100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Column(
              children: [
                Form(
                  key: controller.formKeys,
                  child: Obx(
                    () => Column(
                      children: [
                        const UserAvatarEditWidget(),
                        const SizedBox(height: 16),
                        TextFormFieldWidget(
                          controller: controller.nameController,
                          fieldTitle: 'Name',
                          validator: FormValidators.validateName,
                        ),
                        const SizedBox(height: 16),
                        TextFormFieldWidget(
                          controller: controller.emailController,
                          fieldTitle: 'Email',
                          validator: FormValidators.validateEmail,
                        ),
                        const SizedBox(height: 16),
                        TextFormFieldWidget(
                          controller: controller.passwordController,
                          fieldTitle: 'Password',
                          validator: FormValidators.validatePassword,
                        ),
                        const SizedBox(height: 16),
                        TextFormFieldWidget(
                          controller: controller.phoneNumberController,
                          fieldTitle: 'Phone Number',
                          validator: FormValidators.validateNumber,
                        ),
                        const SizedBox(height: 16),
                        DropdownInputFieldWidget(
                          value: controller.selectedRole.value.isNotEmpty
                              ? controller.selectedRole.value
                              : null,
                          fieldTitle: 'Jabatan',
                          hintText: 'Pilih jabatan...',
                          items: const [
                            'Account Officer',
                            'Manajer',
                          ],
                          onChanged: (value) {
                            controller.setRole(value);
                          },
                        ),
                        const SizedBox(height: 16),
                        DropdownInputFieldWidget(
                          value:
                              controller.selectedServiceBranch.value.isNotEmpty
                                  ? controller.selectedServiceBranch.value
                                  : null,
                          fieldTitle: 'Service Branch',
                          hintText: 'Select service branch',
                          items: const ['Ciluar', 'Dramaga'],
                          onChanged: (value) {
                            controller.setServiceBranch(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Obx(
                  () => FormButtonWidget(
                    isLoading: controller.isLoading.value,
                    text: "Edit",
                    width: 148,
                    onTap: () {
                      controller.updateUser();
                    },
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
