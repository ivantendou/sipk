import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScoringFormController extends GetxController {
  var currentIndex = 0.obs;
  var stepCompleted = List.generate(8, (index) => false).obs;

  final formKeys = List.generate(8, (index) => GlobalKey<FormState>());

  //sample
  final sampleController = TextEditingController();
  RxString stringVariable = RxString("");
  var selectedDate = Rxn<DateTime>();
  Rx<String> selectedOption = Rx<String>('Tidak');

  void nextStep() {
    if (formKeys[currentIndex.value].currentState!.validate()) {
      stepCompleted[currentIndex.value] = true;
      if (currentIndex.value < 7) {
        currentIndex.value++;
      }
    }
  }

  void prevStep() {
    if (currentIndex.value > 0) {
      stepCompleted[currentIndex.value] = false;
      currentIndex.value--;
    }
  }

  void setSelectedOption(String value) => selectedOption.value = value;
}
