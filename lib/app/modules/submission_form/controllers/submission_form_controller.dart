import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/ao_submission/controllers/ao_submission_controller.dart';
import 'package:sipk/app/routes/app_pages.dart';
import 'package:sipk/app/services/submission_service.dart';
import 'package:sipk/models/financial_data_model.dart';

class SubmissionFormController extends GetxController {
  final SubmissionService submissionService = SubmissionService();
  final applicantId = ''.obs;
  final applicationId = ''.obs;
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;
  final name = ''.obs;
  final ktpNumber = ''.obs;
  final maxInstallment = 0.0.obs;
  final maxFinancing = 0.0.obs;
  final Rxn<String> officeBranch = Rxn<String>();
  final Rxn<String> memberStatus = Rxn<String>();
  final TextEditingController allocation = TextEditingController();
  final TextEditingController applicationAmount = TextEditingController();

  void callAoSubmissionController() {
    final aoSubmissionController =
        Get.put<AoSubmissionController>(AoSubmissionController());

    aoSubmissionController.refreshApplications();
  }

  void fetchFinancialData() async {
    final response =
        await submissionService.fetchFinancialData(applicantId.value);
    final financialData = FinancialDataModel.fromJson(response).financialData;

    if (financialData != null) {
      final totalIncome = (financialData.netSalaryApplicant ?? 0) +
          (financialData.netSalarySpouse ?? 0) +
          (financialData.netBusinessIncomeApplicant ?? 0) +
          (financialData.netBusinessIncomeSpouse ?? 0);

      final totalExpense = (financialData.householdExpense ?? 0) +
          (financialData.transportationExpense ?? 0) +
          (financialData.communicationExpense ?? 0) +
          (financialData.educationExpense ?? 0) +
          (financialData.utilityBills ?? 0) +
          (financialData.ongoingInstallment ?? 0) +
          (financialData.entertainmentSocialExpense ?? 0);

      final sisaPenghasilan = totalIncome - totalExpense;

      final maksimalAngsuran = sisaPenghasilan * 0.5;

      const tenorBulan = 12;
      final ekvRate = (financialData.ekvRate ?? 0) / 100;
      final tipeAngsuran =
          financialData.installmentType?.toLowerCase() ?? "flat";

      double jumlahPembiayaan;

      if (tipeAngsuran == "flat") {
        jumlahPembiayaan = maksimalAngsuran / (1 / tenorBulan + ekvRate);
      } else if (tipeAngsuran == "anuitas") {
        jumlahPembiayaan = maksimalAngsuran /
            ((ekvRate * pow(1 + ekvRate, tenorBulan)) /
                (pow(1 + ekvRate, tenorBulan) - 1));
      } else {
        jumlahPembiayaan = maksimalAngsuran * tenorBulan;
      }

      maxInstallment.value = maksimalAngsuran;
      maxFinancing.value = jumlahPembiayaan.round().toDouble();
    }
  }

  void postFinancingApplications() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      isLoading(true);
      final prefs = await SharedPreferences.getInstance();
      final accountOfficerId = prefs.getString('userId');
      final response = await submissionService.postFinancingApplications(
        applicantId: applicantId.value,
        accountOfficerId: accountOfficerId ?? "",
        applicationAmount: applicationAmount.text,
        allocation: allocation.text,
        officeBranch: officeBranch.value ?? "",
        memberStatus: memberStatus.value ?? "",
        applicationStatus: "Pending",
        name: name.value,
        ktpNumber: ktpNumber.value,
      );
      applicationId.value = response;
      showPostDataSuccess();
      callAoSubmissionController();
    } catch (e) {
      showPostDataFailed();
      if (kDebugMode) {
        print('Error fetching scoring steps: $e');
      }
    } finally {
      isLoading(false);
    }
  }

  void showPostDataFailed() {
    Get.defaultDialog(
      barrierDismissible: false,
      backgroundColor: ColorsConstant.white,
      contentPadding: const EdgeInsets.only(bottom: 24),
      title: 'Submit Data Failed',
      titleStyle: TextStyleConstant.subHeading.copyWith(
        fontWeight: FontWeight.bold,
      ),
      titlePadding: const EdgeInsets.only(top: 24, bottom: 16),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Assets.images.errorImage.svg(
              width: 80,
              colorFilter: const ColorFilter.mode(
                Colors.red,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'An error occurred while submitting the financing application data. Please check your internet connection and try again.',
              style: TextStyleConstant.body,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      confirm: InkWell(
        onTap: () {
          Get.back();
        },
        child: Ink(
          width: 180,
          height: 49,
          decoration: const BoxDecoration(
            color: ColorsConstant.primary,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Center(
            child: Text(
              'OK',
              style: TextStyleConstant.subHeading2.copyWith(
                color: ColorsConstant.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showPostDataSuccess() {
    Get.defaultDialog(
      backgroundColor: ColorsConstant.white,
      contentPadding: const EdgeInsets.only(bottom: 24),
      title: 'Application Submitted Successfully',
      titleStyle: TextStyleConstant.subHeading.copyWith(
        fontWeight: FontWeight.bold,
      ),
      titlePadding:
          const EdgeInsets.only(top: 24, bottom: 16, right: 8, left: 8),
      onWillPop: () async {
        Get.back();
        return true;
      },
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Assets.images.success.svg(
              width: 80,
              colorFilter: const ColorFilter.mode(
                Colors.green,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Application data has been successfully submitted.\nPlease wait for the verification process.',
              style: TextStyleConstant.body,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      confirm: InkWell(
        onTap: () {
          Get.back();
          Get.offNamed(
            Routes.SUBMISSION_DETAIL,
            parameters: {'id': applicationId.value},
          );
        },
        child: Ink(
          width: 216,
          height: 49,
          decoration: const BoxDecoration(
            color: ColorsConstant.primary,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Center(
            child: Text(
              'View Application Data',
              style: TextStyleConstant.subHeading2.copyWith(
                color: ColorsConstant.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
