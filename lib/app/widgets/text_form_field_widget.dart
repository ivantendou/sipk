// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String fieldTitle;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? Function(String?, String)? validator;

  const TextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.fieldTitle,
    this.hintText,
    this.keyboardType = TextInputType.text,
    required this.validator,
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
          textInputAction: TextInputAction.next,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
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
          keyboardType: keyboardType,
          style: TextStyleConstant.body,
          validator: (value) => validator?.call(value, fieldTitle),
        ),
      ],
    );
  }
}
