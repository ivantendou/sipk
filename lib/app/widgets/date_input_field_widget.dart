// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sipk/app/constants/text_style_constant.dart';

class DateInputFieldWidget extends StatelessWidget {
  final GetxController controller;
  final String hintText;
  final String fieldTitle;
  final void Function(DateTime?)? onChanged;

  const DateInputFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.fieldTitle,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldTitle,
          style: TextStyleConstant.body,
        ),
        DateTimeFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 0,
            ),
            prefixIcon: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: SizedBox(),
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
            ),
            hintText: hintText,
            hintStyle: TextStyleConstant.body,
          ),
          onChanged: onChanged,
          mode: DateTimeFieldPickerMode.date,
          validator: (DateTime? value) {
            if (value == null) {
              return "Tanggal tidak boleh kosong";
            }
            if (value.isAfter(DateTime.now())) {
              return "Tanggal tidak boleh di masa depan";
            }
            return null;
          },
          style: TextStyleConstant.body,
        ),
      ],
    );
  }
}
