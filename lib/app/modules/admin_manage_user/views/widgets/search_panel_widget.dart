import 'package:flutter/material.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/widgets/search_text_field_widget.dart';

class SearchUserPanelWidget extends StatelessWidget {
  final String hintText;
  final String option;
  final void Function()? onTap;

  const SearchUserPanelWidget({
    Key? key,
    required this.hintText,
    required this.option,
    required this.onTap,
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
          padding: const EdgeInsets.only(
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
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      height: 28,
                      decoration: const BoxDecoration(
                        color: ColorsConstant.primary,
                        borderRadius:
                            BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            option,
                            style: TextStyleConstant.caption.copyWith(
                              color: ColorsConstant.white,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Assets.images.chevronDownThin.svg(
                            width: 16,
                            colorFilter: const ColorFilter.mode(
                              ColorsConstant.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
