import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sipk/app/modules/submission_form/controllers/submission_form_controller.dart';
import 'package:sipk/app/services/scoring_service.dart';
import 'package:sipk/models/credit_score_model.dart';

class AoScoringDetailController extends GetxController {
  final ScoringService scoringService = ScoringService();
  final isLoading = false.obs;
  final isFromSubmissionPage = ''.obs;
  Rxn<CreditScoreModel> creditScoreData = Rxn<CreditScoreModel>();

  @override
  void onInit() {
    super.onInit();
    final String id = Get.parameters['id'] ?? 'No message received';
    isFromSubmissionPage.value = Get.parameters['isFrom'] ?? 'false';
    fetchCreditScore(id);
  }

  void callSubmissionFormController(
      String userId, String name, String ktpNumber) {
    final submissionFormController =
        Get.put<SubmissionFormController>(SubmissionFormController());

    submissionFormController.applicantId.value = userId;
    submissionFormController.name.value = name;
    submissionFormController.ktpNumber.value = ktpNumber;
    submissionFormController.fetchFinancialData();
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
