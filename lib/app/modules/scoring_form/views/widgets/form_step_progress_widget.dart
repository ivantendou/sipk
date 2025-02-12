// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/scoring_form/controllers/scoring_form_controller.dart';

class FormStepProgressWidget extends StatelessWidget {
  final ScoringFormController controller;

  const FormStepProgressWidget({
    Key? key,
    required this.controller,
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
          child: Obx(
            () {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(8, (index) {
                  bool isCompleted = controller.stepCompleted[index];
                  bool isCurrent = controller.currentIndex == index;
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              offset: const Offset(0, 1),
                              blurRadius: 4,
                              spreadRadius: 0,
                            ),
                          ],
                          borderRadius: const BorderRadiusDirectional.all(
                              Radius.circular(18)),
                        ),
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: isCompleted || isCurrent
                              ? ColorsConstant.primary
                              : ColorsConstant.white,
                          child: isCompleted
                              ? Assets.images.check.svg(
                                  height: 24,
                                  colorFilter: const ColorFilter.mode(
                                    ColorsConstant.white,
                                    BlendMode.srcIn,
                                  ),
                                )
                              : Text(
                                  '${index + 1}',
                                  style: TextStyleConstant.body.copyWith(
                                    color: isCurrent
                                        ? ColorsConstant.white
                                        : ColorsConstant.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
