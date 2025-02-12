import 'package:flutter/material.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/widgets/filter_button_widget.dart';
import 'package:sipk/app/widgets/option_button_widget.dart';
import 'package:sipk/app/widgets/search_text_field_widget.dart';

class SearchPanelWidget extends StatelessWidget {
  final void Function()? onFilterTap;
  final void Function()? onFirstOptionTap;
  final void Function()? onSecondOptionTap;
  final String hintText;

  const SearchPanelWidget ({
    Key? key,
    required this.onFilterTap,
    required this.onFirstOptionTap,
    required this.onSecondOptionTap,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Material(
        elevation: 1,
        shadowColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(
            right: 16,
            left: 16,
            top: 16,
            bottom: 8,
          ),
          color: ColorsConstant.grey100,
          child: Column(
            children: [
              SearchTextFieldWidget(
                hintText: hintText,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  FilterButtonWidget(onTap: onFilterTap),
                  const SizedBox(width: 8),
                  OptionButtonWidget(onTap: onFirstOptionTap, option: 'Terbaru'),
                  const SizedBox(width: 8),
                  OptionButtonWidget(onTap: onSecondOptionTap, option: 'Selesai'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
