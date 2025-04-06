import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sipk/app/routes/app_pages.dart';
import 'package:sipk/app/services/scoring_service.dart';
import 'package:sipk/models/credit_scores_model.dart';

class AoHomeController extends GetxController {
  final ScoringService scoringService = ScoringService();
  late String? applicantId;
  final isLoading = false.obs;
  final RxList<CreditScoresModel> scoringDraft = <CreditScoresModel>[].obs;
  final RxList<CreditScoresModel> scoringResult = <CreditScoresModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCreditScores();
  }

  Future<void> createForm() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    applicantId = await scoringService.createForm(userId: userId!);
    Get.toNamed(
      Routes.SCORING_FORM,
      arguments: {'applicantId': applicantId},
    );
  }

  void fetchCreditScores() async {
    isLoading(true);
    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');

      scoringDraft.assignAll(await scoringService.fetchCreditScores(
        searchQuery: "",
        accountOfficerId: userId ?? "",
        from: 0,
        to: 10,
        ascending: false,
        isDraft: true,
      ));

      scoringResult.assignAll(await scoringService.fetchCreditScores(
        searchQuery: "",
        accountOfficerId: userId ?? "",
        from: 0,
        to: 10,
        ascending: false,
        isDraft: false,
      ));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoading(false);
    }
  }
}
