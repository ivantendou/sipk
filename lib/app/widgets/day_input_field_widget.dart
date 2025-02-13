import 'package:flutter/material.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class DayInputFieldWidget extends StatelessWidget {
  final String fieldTitle;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? hintText;

  const DayInputFieldWidget({
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
            if (value == null) {
              return 'Hari tidak boleh kosong';
            }
            final double? number = double.tryParse(value);
            if (number == null) {
              return 'Hari harus berupa angka';
            }
            if (number != number.toInt()) {
              return 'Hari harus berupa bilangan bulat, tanpa koma';
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
              width: 56,
              child: Center(
                child: Text(
                  'hari',
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
