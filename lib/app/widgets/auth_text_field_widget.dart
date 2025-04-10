// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class AuthTextFieldWidget extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;

  const AuthTextFieldWidget({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    required this.validator,
    this.obscureText = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      obscureText: obscureText,
      style: TextStyleConstant.body,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        hintText: hintText,
        hintStyle: TextStyleConstant.body,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: prefixIcon,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: suffixIcon,
        ),
      ),
    );
  }
}
