import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/manager_submission/controllers/manager_submission_controller.dart';
import 'package:sipk/app/services/submission_service.dart';
import 'package:sipk/app/widgets/custom_button_widget.dart';
import 'package:sipk/models/financing_application_model.dart';

class SubmissionDetailController extends GetxController {
  final SubmissionService submissionService = SubmissionService();
  final applicationId = ''.obs;
  final isLoading = false.obs;
  Rxn<FinancingApplicationModel> financingApplicationData =
      Rxn<FinancingApplicationModel>();
  final userRole = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    applicationId.value = Get.parameters['id'] ?? '';
    final prefs = await SharedPreferences.getInstance();
    userRole.value = prefs.getString('role') ?? "";
    fetchFinancingApplication();
  }

  void callManagerSubmissionController() {
    final secondController = Get.find<ManagerSubmissionController>();

    secondController.fetchLatestSubmissions();
  }

  void fetchFinancingApplication() async {
    try {
      isLoading(true);
      final response = await submissionService
          .fetchFinancingApplication(applicationId.value);
      financingApplicationData.value =
          FinancingApplicationModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoading(false);
    }
  }

  void deleteSubmission() async {
    await submissionService.deleteSubmission(applicationId.value);
    Get.back();
  }

  Future<void> rejectSubmission() async {
    await submissionService.rejectSubmission(applicationId.value);
  }

  Future<void> acceptSubmission() async {
    await submissionService.acceptSubmission(applicationId.value);
  }

  void showCancelConfirmationDialog() {
    Get.defaultDialog(
      title: 'Batalkan Pengajuan',
      titleStyle: TextStyleConstant.subHeading.copyWith(
        fontWeight: FontWeight.bold,
      ),
      titlePadding: const EdgeInsets.only(top: 16),
      content: const Text(
        'Apakah Anda yakin ingin membatalkan pengajuan ini?',
        style: TextStyleConstant.body,
        textAlign: TextAlign.center,
      ),
      contentPadding: const EdgeInsets.all(16),
      confirm: CustomButtonWidget(
        text: 'Ya',
        width: 120,
        onTap: () async {
          Get.back();
          deleteSubmission();
        },
      ),
      cancel: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: CustomButtonWidget(
          text: 'Tidak',
          width: 120,
          onTap: () => Get.back(),
          buttonColor: ColorsConstant.white,
          borderColor: ColorsConstant.primary,
          textColor: ColorsConstant.primary,
        ),
      ),
    );
  }

  void showRejectConfirmationDialog() {
    Get.defaultDialog(
      title: 'Tolak Pengajuan',
      titleStyle: TextStyleConstant.subHeading.copyWith(
        fontWeight: FontWeight.bold,
      ),
      titlePadding: const EdgeInsets.only(top: 16),
      content: const Text(
        'Apakah Anda yakin ingin menolak pengajuan ini?',
        style: TextStyleConstant.body,
        textAlign: TextAlign.center,
      ),
      contentPadding: const EdgeInsets.all(16),
      confirm: CustomButtonWidget(
        text: 'Tolak',
        width: 120,
        onTap: () async {
          Get.back();
          await rejectSubmission();
          fetchFinancingApplication();
          callManagerSubmissionController();
        },
      ),
      cancel: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: CustomButtonWidget(
          text: 'Batal',
          width: 120,
          onTap: () => Get.back(),
          buttonColor: ColorsConstant.white,
          borderColor: ColorsConstant.primary,
          textColor: ColorsConstant.primary,
        ),
      ),
    );
  }

  void showAcceptConfirmationDialog() {
    Get.defaultDialog(
      title: 'Terima Pengajuan',
      titleStyle: TextStyleConstant.subHeading.copyWith(
        fontWeight: FontWeight.bold,
      ),
      titlePadding: const EdgeInsets.only(top: 16),
      content: const Text(
        'Apakah Anda yakin ingin menyetujui pengajuan ini?',
        style: TextStyleConstant.body,
        textAlign: TextAlign.center,
      ),
      contentPadding: const EdgeInsets.all(16),
      confirm: CustomButtonWidget(
        text: 'Terima',
        width: 120,
        onTap: () async {
          Get.back();
          await acceptSubmission();
          fetchFinancingApplication();
          callManagerSubmissionController();
        },
      ),
      cancel: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: CustomButtonWidget(
          text: 'Batal',
          width: 120,
          onTap: () => Get.back(),
          buttonColor: ColorsConstant.white,
          borderColor: ColorsConstant.primary,
          textColor: ColorsConstant.primary,
        ),
      ),
    );
  }
}
