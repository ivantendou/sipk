import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sipk/app/services/submission_service.dart';
import 'package:sipk/models/financing_applications_model.dart';

class ManagerSubmissionController extends GetxController {
  final SubmissionService submissionService = SubmissionService();
  final RxList<FinancingApplicationsModel> latestSubmissions =
      <FinancingApplicationsModel>[].obs;
  final isLoading = false.obs;
  final username = ''.obs;
  final hasError = false.obs;
  final errorMessage = 'Terjadi kesalahan saat memuat data'.obs;

  @override
  void onInit() async {
    super.onInit();
    await loadUsername();
    fetchLatestSubmissions();
  }

  Future<void> loadUsername() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      username.value = prefs.getString('username') ?? "";
    } catch (e) {
      if (kDebugMode) {
        print('Error loading username: $e');
      }
    }
  }

  Future<void> fetchLatestSubmissions() async {
    isLoading(true);
    hasError(false);

    try {
      List<FinancingApplicationsModel> fetchedData =
          await submissionService.fetchFinancingApplicationsAdmin(
        searchQuery: '',
        from: 0,
        to: 2,
        ascending: false,
        applicationStatus: "Pending",
      );

      latestSubmissions.value = fetchedData;
    } catch (e) {
      hasError(true);
      errorMessage.value = 'Gagal memuat data: ${e.toString()}';
      if (kDebugMode) {
        print('Error fetching submissions: $e');
      }
    } finally {
      isLoading(false);
    }
  }

  void refreshSubmissions() {
    fetchLatestSubmissions();
  }
}
