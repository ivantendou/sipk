import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sipk/app/services/submission_service.dart';
import 'package:sipk/models/financing_application_model.dart';

class AoSubmissionController extends GetxController {
  final SubmissionService submissionService = SubmissionService();

  final RxList<FinancingApplicationModel> pendingApplications =
      <FinancingApplicationModel>[].obs;
  final RxList<FinancingApplicationModel> acceptedApplications =
      <FinancingApplicationModel>[].obs;
  final RxList<FinancingApplicationModel> rejectedApplications =
      <FinancingApplicationModel>[].obs;

  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchApplications();
  }

  Future<void> fetchApplications() async {
    isLoading.value = true;

    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');

      if (userId == null || userId.isEmpty) {
        return;
      }

      final response =
          await submissionService.fetchMonthlyFinancingApplications(userId);

      pendingApplications.clear();
      acceptedApplications.clear();
      rejectedApplications.clear();

      for (var appData in response) {
        final application = FinancingApplicationModel.fromJson(appData);
        final status =
            application.financingApplication?.applicationStatus ?? '';

        if (status == 'Pending') {
          pendingApplications.add(application);
        } else if (status == 'Accepted') {
          acceptedApplications.add(application);
        } else if (status == 'Rejected') {
          rejectedApplications.add(application);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshApplications() async {
    await fetchApplications();
  }
}
