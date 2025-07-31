import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sipk/app/modules/submission_form/controllers/submission_form_controller.dart';
import 'package:sipk/app/services/scoring_service.dart';
import 'package:sipk/models/credit_scores_model.dart';

class AoSelectScoringController extends GetxController {
  final ScoringService scoringService = ScoringService();
  final PagingController<int, CreditScoresModel> pagingController =
      PagingController(firstPageKey: 0);
  final isLoading = false.obs;
  final int pageSize = 10;
  final searchQuery = ''.obs;
  final selectedSortOption = 'terbaru'.obs;

  @override
  void onInit() {
    super.onInit();

    debounce(
      searchQuery,
      (_) {
        pagingController.refresh();
      },
      time: const Duration(milliseconds: 500),
    );

    pagingController.addPageRequestListener((pageKey) {
      fetchCreditScores(pageKey);
    });
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }

  void applyFilters() {
    pagingController.refresh();
  }

  void callSubmissionFormController(
      String userId, String name, String ktpNumber) {
    final submissionFormController = Get.find<SubmissionFormController>();

    submissionFormController.applicantId.value = userId;
    submissionFormController.name.value = name;
    submissionFormController.ktpNumber.value = ktpNumber;
    submissionFormController.fetchFinancialData();
  }

  void changeSortOption(String option) {
    selectedSortOption.value = option;
  }

  Future<void> fetchCreditScores(int pageKey) async {
    if (isLoading.value) return;
    isLoading(true);

    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');

      final isAscending = selectedSortOption.value == 'terlama';

      final int from = pageKey * pageSize;
      final int to = from + pageSize - 1;

      List<CreditScoresModel> fetchedData;

      fetchedData = await scoringService.fetchCreditScores(
        accountOfficerId: userId!,
        searchQuery: searchQuery.value,
        from: from,
        to: to,
        ascending: isAscending,
        isDraft: false,
      );

      final isLastPage = fetchedData.length < pageSize;

      if (isLastPage) {
        pagingController.appendLastPage(fetchedData);
      } else {
        pagingController.appendPage(fetchedData, pageKey + 1);
      }
    } catch (e) {
      pagingController.error = e;
    } finally {
      isLoading(false);
    }
  }

  void resetFilters() {
    selectedSortOption.value = 'terbaru';
  }

  void updateSearchQuery(String text) {
    searchQuery.value = text;
  }
}
