import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sipk/app/routes/app_pages.dart';
import 'package:sipk/app/services/scoring_service.dart';
import 'package:sipk/models/credit_scores_model.dart';

class ScoringDataController extends GetxController {
  final ScoringService scoringService = ScoringService();
  final PagingController<int, CreditScoresModel> pagingController =
      PagingController(firstPageKey: 0);
  late String? applicantId;
  final isLoading = false.obs;
  final isSelectionMode = false.obs;
  final int pageSize = 10;
  final searchQuery = ''.obs;
  final selectedCreditScores = <String, bool>{}.obs;
  var selectedSortOption = 'terbaru'.obs;
  var showDraftsOnly = false.obs;

  @override
  void onInit() {
    super.onInit();
    final bool isDraftOnly = Get.arguments ?? false;
    showDraftsOnly.value = isDraftOnly;
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

  void changeSortOption(String option) {
    selectedSortOption.value = option;
  }

  void createForm() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    applicantId = await scoringService.createForm(userId: userId!);
    Get.toNamed(
      Routes.SCORING_FORM,
      arguments: {'applicantId': applicantId},
    );
  }

  Future<void> deleteSelectedData() async {
    try {
      isLoading(true);

      List<String> creditScoresToDelete = selectedDataId;

      if (creditScoresToDelete.isEmpty) return;

      await scoringService.deleteCreditScores(creditScoresToDelete);
      isLoading(false);
      pagingController.refresh();
      isSelectionMode(false);
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text('Gagal menghapus data: ${e.toString()}'),
          duration: const Duration(seconds: 2),
        ),
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchCreditScores(int pageKey) async {
    if (isLoading.value) return;
    isLoading(true);

    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');
      final role = prefs.getString('role');

      final isAscending = selectedSortOption.value == 'terlama';

      final int from = pageKey * pageSize;
      final int to = from + pageSize - 1;

      List<CreditScoresModel> fetchedData;

      if (role == 'Admin') {
        fetchedData = await scoringService.fetchCreditScoresAdmin(
          searchQuery: searchQuery.value,
          from: from,
          to: to,
          ascending: isAscending,
          isDraft: showDraftsOnly.value,
        );
      } else {
        fetchedData = await scoringService.fetchCreditScores(
            searchQuery: searchQuery.value,
            accountOfficerId: userId ?? "",
            from: from,
            to: to,
            ascending: isAscending,
            isDraft: showDraftsOnly.value);
      }

      for (var data in fetchedData) {
        if (!selectedCreditScores.containsKey(data.id)) {
          selectedCreditScores[data.id!] = false;
        }
      }

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
    showDraftsOnly.value = false;
  }

  List<String> get selectedDataId => selectedCreditScores.entries
      .where((entry) => entry.value)
      .map((entry) => entry.key)
      .toList();

  void selectAll() {
    bool allSelected =
        selectedCreditScores.values.every((selected) => selected);
    selectedCreditScores.updateAll((key, value) => !allSelected);
  }

  int get selectedCount =>
      selectedCreditScores.values.where((selected) => selected).length;

  void toggleDraftFilter(bool value) {
    showDraftsOnly.value = value;
  }

  void toggleSelectionMode() {
    isSelectionMode.toggle();
    if (!isSelectionMode.value) {
      selectedCreditScores.updateAll((key, value) => false);
    }
  }

  void toggleSelection(String id) {
    if (selectedCreditScores.containsKey(id)) {
      selectedCreditScores[id] = !selectedCreditScores[id]!;
    } else {
      selectedCreditScores[id] = true;
    }
  }

  void updateSearchQuery(String text) {
    searchQuery.value = text;
  }
}
