import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/scoring_form/views/widgets/cancel_confirmation_dialog_widget.dart';
import 'package:sipk/app/modules/scoring_form/views/widgets/form_step_progress_widget.dart';
import 'package:sipk/app/modules/scoring_form/views/widgets/step_eight_form_widget.dart';
import 'package:sipk/app/modules/scoring_form/views/widgets/step_five_form_widget.dart';
import 'package:sipk/app/modules/scoring_form/views/widgets/step_four_form_widget.dart';
import 'package:sipk/app/modules/scoring_form/views/widgets/step_navigation_buttons_widget.dart';
import 'package:sipk/app/modules/scoring_form/views/widgets/step_one_form_widget.dart';
import 'package:sipk/app/modules/scoring_form/views/widgets/step_seven_form_widget.dart';
import 'package:sipk/app/modules/scoring_form/views/widgets/step_six_form_widget.dart';
import 'package:sipk/app/modules/scoring_form/views/widgets/step_three_form_widget.dart';
import 'package:sipk/app/modules/scoring_form/views/widgets/step_two_form_widget.dart';

import '../controllers/scoring_form_controller.dart';

class ScoringFormView extends GetView<ScoringFormController> {
  const ScoringFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          title: Text(
            'Data Skoring',
            style: TextStyleConstant.subHeading2.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              if (controller.currentIndex.value == 0 &&
                  controller.financingType.value == null &&
                  controller.childCountController.text.isEmpty) {
                controller.deleteForm();
                Get.back();
              } else {
                showCancelConfirmationDialog(controller);
              }
            },
            icon: SizedBox(
              height: 24,
              width: 24,
              child: Assets.images.arrowLeft.svg(),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: ColorsConstant.grey500,
              height: 1.0,
            ),
          ),
        ),
        backgroundColor: ColorsConstant.grey100,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(top: 76, left: 16, right: 16),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Obx(() {
                          return Form(
                            key: controller
                                .formKeys[controller.currentIndex.value],
                            child: getStepWidget(
                              controller.currentIndex.value,
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                  StepNavigationButtonsWidget(controller: controller),
                ],
              ),
            ),
            FormStepProgressWidget(controller: controller),
          ],
        ),
      ),
    );
  }

  Widget getStepWidget(int index) {
    switch (index) {
      case 0:
        return StepOneFormWidget(controller: controller);
      case 1:
        return StepTwoFormWidget(controller: controller);
      case 2:
        return StepThreeFormWidget(controller: controller);
      case 3:
        return StepFourFormWidget(controller: controller);
      case 4:
        return StepFiveFormWidget(controller: controller);
      case 5:
        return StepSixFormWidget(controller: controller);
      case 6:
        return StepSevenFormWidget(controller: controller);
      case 7:
        return StepEightFormWidget(controller: controller);
      default:
        return const SizedBox();
    }
  }
}
