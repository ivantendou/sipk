import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/scoring_form/views/widgets/form_step_progress_widget.dart';
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
                              controller.currentIndex.value,
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: controller.prevStep,
                          child: const Text("Back"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (controller.currentIndex.value == 7 &&
                                controller.formKeys[7].currentState!
                                    .validate()) {
                              Get.snackbar("Success", "Form Submitted!");
                            } else {
                              controller.nextStep();
                            }
                          },
                          child: Obx(() => Text(
                              controller.currentIndex.value == 4
                                  ? "Submit"
                                  : "Next")),
                        ),
                      ],
                    ),
                  ),
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
        return Column(
          children: [
            const Text("Step 1: Nama"),
            TextFormField(
              // controller: controller.nameController,
              decoration: const InputDecoration(labelText: "Nama Lengkap"),
              validator: (value) =>
                  value!.isEmpty ? "Nama tidak boleh kosong" : null,
            ),
          ],
        );
      case 1:
        return Column(
          children: [
            const Text("Step 2: Email"),
            TextFormField(
              // controller: controller.emailController,
              decoration: const InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
              validator: (value) =>
                  value!.isEmpty ? "Email tidak boleh kosong" : null,
            ),
          ],
        );
      case 2:
        return Column(
          children: [
            const Text("Step 3: Password"),
            TextFormField(
              // controller: controller.passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
              validator: (value) =>
                  value!.length < 6 ? "Password minimal 6 karakter" : null,
            ),
          ],
        );
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
