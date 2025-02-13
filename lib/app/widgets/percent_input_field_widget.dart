import 'package:flutter/material.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class PercentInputFieldWidget extends StatelessWidget {
  final String fieldTitle;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? hintText;

  const PercentInputFieldWidget({
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
              return 'Persentase tidak boleh kosong';
            }
            final double? percent = double.tryParse(value);
            if (percent == null) {
              return 'Harus berupa angka';
            }
            if (percent < 0 || percent > 100) {
              return 'Persentase harus antara 0 dan 100';
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
              width: 36,
              child: Center(
                child: Text(
                  '%',
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
