import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sipk/app/modules/ao_submission/controllers/ao_submission_controller.dart';
import 'package:sipk/app/services/submission_service.dart';
import 'package:sipk/models/financing_applications_model.dart';

class SubmissionDataController extends GetxController {
  final SubmissionService submissionService = SubmissionService();
  final PagingController<int, FinancingApplicationsModel> pagingController =
      PagingController(firstPageKey: 0);
  final isLoading = false.obs;
  final isSelectionMode = false.obs;
  final int pageSize = 10;
  final searchQuery = ''.obs;
  final selectedSubmissions = <String, bool>{}.obs;
  final selectedSortOption = 'terbaru'.obs;
  final selectedApplicationStatus = 'Pending'.obs;
  final userRole = ''.obs;

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
      fetchSubmissions(pageKey);
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

  void callAoSubmissionController() {
    final aoSubmissionController =
        Get.put<AoSubmissionController>(AoSubmissionController());

    aoSubmissionController.refreshApplications();
  }

  void changeSortOption(String option) {
    selectedSortOption.value = option;
  }

  void changeStatusOption(String status) {
    selectedApplicationStatus.value = status;
  }

  Future<void> deleteSelectedData() async {
    try {
      isLoading(true);

      List<String> submissionsToDelete = selectedDataId;

      if (submissionsToDelete.isEmpty) return;

      await submissionService.deleteSubmissions(submissionsToDelete);
      isLoading(false);
      pagingController.refresh();
      isSelectionMode(false);
      if (Get.isRegistered<AoSubmissionController>()) {
        callAoSubmissionController();
      }
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

  Future<void> fetchSubmissions(int pageKey) async {
    if (isLoading.value) return;
    isLoading(true);

    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');
      userRole.value = prefs.getString('role') ?? "";

      final isAscending = selectedSortOption.value == 'terlama';

      final int from = pageKey * pageSize;
      final int to = from + pageSize - 1;

      List<FinancingApplicationsModel> fetchedData;

      if (userRole.value == 'Admin' || userRole.value == 'Manajer') {
        fetchedData = await submissionService.fetchFinancingApplicationsAdmin(
          searchQuery: searchQuery.value,
          from: from,
          to: to,
          ascending: isAscending,
          applicationStatus: selectedApplicationStatus.value,
        );
      } else {
        fetchedData = await submissionService.fetchFinancingApplications(
          searchQuery: searchQuery.value,
          accountOfficerId: userId ?? "",
          from: from,
          to: to,
          ascending: isAscending,
          applicationStatus: selectedApplicationStatus.value,
        );
      }

      for (var data in fetchedData) {
        if (!selectedSubmissions.containsKey(data.id)) {
          selectedSubmissions[data.id!] = false;
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
    selectedApplicationStatus.value = 'Pending';
  }

  void selectAll() {
    bool allSelected = selectedSubmissions.values.every((selected) => selected);
    selectedSubmissions.updateAll((key, value) => !allSelected);
  }

  List<String> get selectedDataId => selectedSubmissions.entries
      .where((entry) => entry.value)
      .map((entry) => entry.key)
      .toList();

  int get selectedCount =>
      selectedSubmissions.values.where((selected) => selected).length;

  void toggleSelectionMode() {
    isSelectionMode.toggle();
    if (!isSelectionMode.value) {
      selectedSubmissions.updateAll((key, value) => false);
    }
  }

  void toggleSelection(String id) {
    if (selectedSubmissions.containsKey(id)) {
      selectedSubmissions[id] = !selectedSubmissions[id]!;
    } else {
      selectedSubmissions[id] = true;
    }
  }

  void updateSearchQuery(String text) {
    searchQuery.value = text;
  }
}
