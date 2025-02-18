import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/admin_user_edit/views/widgets/user_avatar_edit_widget.dart';
import 'package:sipk/app/utils/form_validators.dart';
import 'package:sipk/app/widgets/custom_app_bar_widget.dart';
import 'package:sipk/app/widgets/custom_button_widget.dart';
import 'package:sipk/app/widgets/date_input_field_widget.dart';
import 'package:sipk/app/widgets/dropdown_input_field_widget.dart';
import 'package:sipk/app/widgets/text_form_field_widget.dart';

import '../controllers/admin_user_edit_controller.dart';

class AdminUserEditView extends GetView<AdminUserEditController> {
  const AdminUserEditView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: 'Edit Pengguna'),
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
                const UserAvatarEditWidget(),
                const SizedBox(height: 16),
                TextFormFieldWidget(
                  controller: TextEditingController(),
                  fieldTitle: 'Nama',
                  validator: FormValidators.validateName,
                ),
                const SizedBox(height: 16),
                DropdownInputFieldWidget(
                  fieldTitle: 'Cabang Layanan',
                  hintText: 'Pilih cabang layanan',
                  items: [],
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),
                DropdownInputFieldWidget(
                  fieldTitle: 'Jabatan',
                  hintText: 'Pilih jabatan...',
                  items: const ['Account Officer', 'Manager'],
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),
                TextFormFieldWidget(
                  controller: TextEditingController(),
                  fieldTitle: 'Nomor Telepon',
                  validator: FormValidators.validateNumber,
                ),
                const SizedBox(height: 16),
                TextFormFieldWidget(
                  controller: TextEditingController(),
                  fieldTitle: 'Email',
                  validator: FormValidators.validateAddress,
                ),
                const SizedBox(height: 16),
                DateInputFieldWidget(
                  controller: controller,
                  hintText: 'Pilih tanggal...',
                  fieldTitle: 'Tanggal Mulai Tugas',
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),
                CustomButtonWidget(
                  text: 'Perbarui',
                  width: 148,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
