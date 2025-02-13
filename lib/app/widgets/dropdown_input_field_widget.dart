import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class DropdownInputFieldWidget extends StatelessWidget {
  final String fieldTitle;
  final String hintText;
  final List<String> items;
  final RxString selectedValue;

  const DropdownInputFieldWidget({
    Key? key,
    required this.fieldTitle,
    required this.hintText,
    required this.items,
    required this.selectedValue,
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
        DropdownButtonFormField2<String>(
          style: TextStyleConstant.body,
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          hint: Text(
            hintText,
            style: TextStyleConstant.body.copyWith(
              color: ColorsConstant.grey700,
            ),
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyleConstant.body,
                    ),
                  ))
              .toList(),
          validator: (value) =>
              value == null || value.isEmpty ? "Harus dipilih" : null,
          onChanged: (value) {
            selectedValue.value = value!;
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ],
    );
  }
}
