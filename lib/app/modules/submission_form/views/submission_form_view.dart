import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/widgets/custom_app_bar_widget.dart';
import 'package:sipk/app/widgets/custom_button_widget.dart';
import 'package:sipk/app/widgets/dropdown_input_field_widget.dart';
import 'package:sipk/app/widgets/rupiah_input_field_widget.dart';
import 'package:sipk/app/widgets/text_form_field_widget.dart';

import '../controllers/submission_form_controller.dart';

class SubmissionFormView extends GetView<SubmissionFormController> {
  const SubmissionFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Formulir Pengajuan'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Column(
              children: [
                TextFormFieldWidget(
                  controller: TextEditingController(),
                  fieldTitle: 'Data Skoring Pemohon',
                  validator: null,
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
                  fieldTitle: 'Status Anggota',
                  hintText: 'Pilih status anggota',
                  items: [],
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),
                TextFormFieldWidget(
                  controller: TextEditingController(),
                  fieldTitle: 'Tujuan Pembiayaan',
                  validator: null,
                ),
                const SizedBox(height: 16),
                RupiahInputFieldWidget(
                  controller: TextEditingController(),
                  fieldTitle: 'Jumlah Pengajuan',
                ),
                const SizedBox(height: 16),
                CustomButtonWidget(
                  text: 'Ajukan Permohonan',
                  width: double.infinity,
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
