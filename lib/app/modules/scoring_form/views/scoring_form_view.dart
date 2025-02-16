import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/scoring_form/views/widgets/form_step_progress_widget.dart';
import 'package:sipk/app/modules/scoring_form/views/widgets/step_navigation_buttons_widget.dart';
import 'package:sipk/app/modules/scoring_form/views/widgets/step_one_form_widget.dart';
import 'package:sipk/app/modules/scoring_form/views/widgets/step_three_form_widget.dart';
import 'package:sipk/app/modules/scoring_form/views/widgets/step_two_form_widget.dart';
import 'package:sipk/app/widgets/custom_app_bar_widget.dart';

import '../controllers/scoring_form_controller.dart';

class ScoringFormView extends GetView<ScoringFormController> {
  const ScoringFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBarWidget(title: 'Data Skoring'),
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
                              2,
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
        return Column(
          children: [
            const Text("Step 4: Alamat"),
            TextFormField(
              // controller: controller.addressController,
              decoration: const InputDecoration(labelText: "Alamat Lengkap"),
              validator: (value) =>
                  value!.isEmpty ? "Alamat tidak boleh kosong" : null,
            ),
          ],
        );
      case 4:
        return Column(
          children: [
            const Text("Step 5: Nomor HP"),
            TextFormField(
              // controller: controller.phoneController,
              decoration: const InputDecoration(labelText: "Nomor HP"),
              keyboardType: TextInputType.phone,
              validator: (value) =>
                  value!.length < 10 ? "Nomor HP tidak valid" : null,
            ),
          ],
        );
      default:
        return const SizedBox();
    }
  }
}
