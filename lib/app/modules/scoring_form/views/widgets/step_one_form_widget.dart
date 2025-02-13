// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/scoring_form/controllers/scoring_form_controller.dart';
import 'package:sipk/app/widgets/date_input_field_widget.dart';
import 'package:sipk/app/widgets/day_input_field_widget.dart';
import 'package:sipk/app/widgets/dropdown_input_field_widget.dart';
import 'package:sipk/app/widgets/month_input_field_widget.dart';
import 'package:sipk/app/widgets/percent_input_field_widget.dart';
import 'package:sipk/app/widgets/phone_input_field_widget.dart';
import 'package:sipk/app/widgets/rupiah_input_field_widget.dart';
import 'package:sipk/app/widgets/text_form_field_widget.dart';

class StepOneFormWidget extends StatelessWidget {
  final ScoringFormController controller;

  const StepOneFormWidget({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Data Pribadi Pemohon',
          style: TextStyleConstant.subHeading2.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          fieldTitle: 'Nama Pemohon',
          hintText: 'jdkfajdfkj',
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "Nama tidak boleh kosong";
            }
            if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
              return "Nama hanya boleh berisi huruf dan spasi";
            }
            return null;
          },
          controller: controller.nameController,
        ),
        DropdownInputFieldWidget(
          fieldTitle: 'Pilih Jenis Kelamin',
          hintText: 'Pilih',
          items: ['Laki-laki', 'Perempuan'],
          selectedValue: controller.gender,
        ),
        PhoneInputField(
          controller: controller.nameController,
          fieldTitle: 'Test',
        ),
        DateInputFieldWidget(
          fieldTitle: 'Tanggal lahir',
          hintText: 'Pilih tanggal lahir',
        ),
        RupiahInputFieldWidget(
          fieldTitle: 'Haegag',
          controller: controller.nameController,
        ),
        DayInputFieldWidget(
          fieldTitle: 'Hari hari',
          controller: controller.nameController,
        ),
        MonthInputFieldWidget(
          fieldTitle: 'Bulan',
          controller: controller.nameController,
        ),
        PercentInputFieldWidget(
          fieldTitle: 'Persentase',
          controller: controller.nameController,
        ),
      ],
    );
  }
}
