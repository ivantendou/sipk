import 'package:flutter/material.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/utils/form_validators.dart';

class RupiahInputFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String fieldTitle;
  final String? hintText;
  final void Function(String)? onChanged;


  const RupiahInputFieldWidget({
    Key? key,
    required this.controller,
    required this.fieldTitle,
    this.hintText,
    this.onChanged,

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
            prefixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
            ),
            prefixIcon: SizedBox(
              width: 52,
              child: Center(
                child: Text(
                  'Rp',
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
          validator: (value) => FormValidators.validateNumber(value, fieldTitle),
        )
      ],
    );
  }
}
