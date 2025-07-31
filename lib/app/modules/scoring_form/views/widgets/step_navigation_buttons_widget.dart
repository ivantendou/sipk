// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/scoring_form/controllers/scoring_form_controller.dart';

class StepNavigationButtonsWidget extends StatelessWidget {
  final ScoringFormController controller;

  const StepNavigationButtonsWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        left: 16,
        top: 16,
        bottom: 32,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() {
            return controller.currentIndex.value == 0
                ? const SizedBox()
                : InkWell(
                    onTap: () {
                      controller.prevStep();
                    },
                    child: Container(
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                          color: ColorsConstant.primary,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.images.chevronLeft.svg(
                            height: 20,
                            colorFilter: const ColorFilter.mode(
                              ColorsConstant.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Previous',
                            style: TextStyleConstant.body.copyWith(
                              color: ColorsConstant.white,
                            ),
                          ),
                          const SizedBox(width: 6),
                        ],
                      ),
                    ),
                  );
          }),
          InkWell(
            onTap: () {
              controller.nextStep();
            },
            child: Container(
              height: 40,
              width: 132,
              decoration: BoxDecoration(
                  color: ColorsConstant.primary,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 6),
                  Obx(
                    () => Text(
                      controller.currentIndex.value != 7
                          ? "Next"
                          : "Calculate",
                      style: TextStyleConstant.body.copyWith(
                        color: ColorsConstant.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Assets.images.chevronRight.svg(
                    height: 20,
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
    );
  }
}
