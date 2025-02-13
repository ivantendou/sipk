import 'package:flutter/material.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class PhoneInputField extends StatelessWidget {
  final String fieldTitle;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? hintText;

  const PhoneInputField({
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
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "Nomor telepon tidak boleh kosong";
            }
            if (!RegExp(r'^[8][0-9]{8,12}$').hasMatch(value)) {
              return "Nomor telepon harus diawali angka 8 dan terdiri dari 9-13 digit";
            }
            return null;
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 0,
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
            ),
            prefixIcon: Container(
              margin: const EdgeInsets.only(right: 16),
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: ColorsConstant.grey500,
                    width: 1,
                  ),
                ),
              ),
              width: 56,
              child: Center(
                child: Text(
                  '+62',
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
          style: TextStyleConstant.body,
        )
      ],
    );
  }
}
