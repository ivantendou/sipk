import 'package:flutter/material.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/utils/form_validators.dart';

class PhoneInputField extends StatelessWidget {
  final String fieldTitle;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final String? hintText;
  final String? initialValue;

  const PhoneInputField({
    Key? key,
    required this.fieldTitle,
    required this.controller,
    this.onChanged,
    this.hintText,
    required this.initialValue,
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
          initialValue: initialValue,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 0,
            ),
            hintText: hintText,
            hintStyle: TextStyleConstant.body.copyWith(
              color: ColorsConstant.grey700,
            ),
            prefixIcon: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: SizedBox(),
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
            ),
          ),
          keyboardType: TextInputType.number,
          style: TextStyleConstant.body,
          validator: (value) => FormValidators.validateNumber(value, fieldTitle),
        )
      ],
    );
  }
}
