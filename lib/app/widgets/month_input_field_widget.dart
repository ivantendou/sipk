import 'package:flutter/material.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/utils/form_validators.dart';

class MonthInputFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String fieldTitle;
  final String? hintText;
  final void Function(String)? onChanged;
  final bool isFinancingTerm;

  const MonthInputFieldWidget({
    Key? key,
    required this.controller,
    required this.fieldTitle,
    this.hintText,
    this.onChanged,
    this.isFinancingTerm = false,
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
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
            ),
            keyboardType: TextInputType.number,
            style: TextStyleConstant.body,
            validator: (value) {
              String? numberValidation =
                  FormValidators.validateNumber(value, fieldTitle);
              if (numberValidation != null) return numberValidation;

              int? intValue = int.tryParse(value!);

              if (intValue == null || intValue <= 0) {
                return '$fieldTitle harus lebih dari 0';
              }

              if (isFinancingTerm && intValue > 72) {
                return '$fieldTitle tidak boleh lebih dari 72 bulan (6 tahun)';
              }

              return null;
            })
      ],
    );
  }
}
