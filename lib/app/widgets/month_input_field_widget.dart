import 'package:flutter/material.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class MonthInputFieldWidget extends StatelessWidget {
  final String fieldTitle;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? hintText;

  const MonthInputFieldWidget({
    Key? key,
    required this.fieldTitle,
    required this.controller,
    this.validator,
    this.onChanged,
    this.hintText,
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
        TextFormField(
          style: TextStyleConstant.body,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Bulan tidak boleh kosong';
            }
            final int? month = int.tryParse(value);
            if (month == null) {
              return 'Harus berupa angka';
            }
            if (month < 1 || month > 12) {
              return 'Bulan harus antara 1 dan 12';
            }
            return null;
          },
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
            suffixIcon: SizedBox(
              width: 64,
              child: Center(
                child: Text(
                  'bulan',
                  style: TextStyleConstant.body.copyWith(
                    color: ColorsConstant.grey900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
        )
      ],
    );
  }
}
