// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final String? hintText;

  const SearchTextFieldWidget({
    Key? key,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        hintText: hintText,
        hintStyle: TextStyleConstant.body,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Assets.images.search.svg(width: 24),
        ),
      ),
    );
  }
}
