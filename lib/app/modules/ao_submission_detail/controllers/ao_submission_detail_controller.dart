import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sipk/app/services/submission_service.dart';
import 'package:sipk/models/financing_application_model.dart';

class AoSubmissionDetailController extends GetxController {
  final SubmissionService submissionService = SubmissionService();
  final applicationId = ''.obs;
  final isLoading = false.obs;
  Rxn<FinancingApplicationModel> financingApplicationData =
      Rxn<FinancingApplicationModel>();
  @override
  void onInit() {
    super.onInit();
    applicationId.value = Get.parameters['id'] ?? '';
    fetchFinancingApplication();
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
}
