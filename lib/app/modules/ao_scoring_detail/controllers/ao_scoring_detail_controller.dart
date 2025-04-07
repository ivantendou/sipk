import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sipk/app/services/scoring_service.dart';
import 'package:sipk/models/credit_score_model.dart';

class AoScoringDetailController extends GetxController {
  final ScoringService scoringService = ScoringService();
  final isLoading = false.obs;
  Rxn<CreditScoreModel> creditScoreData = Rxn<CreditScoreModel>();

  @override
  void onInit() {
    super.onInit();
    final String id = Get.parameters['id'] ?? 'No message received';
    fetchCreditScore(id);
  }

  void fetchCreditScore(String id) async {
    try {
      isLoading(true);
      var response = await scoringService.fetchCreditScore(id);
      creditScoreData.value = CreditScoreModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoading(false);
    }
  }
}
