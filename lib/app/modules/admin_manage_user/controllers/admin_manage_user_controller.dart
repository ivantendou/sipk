import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sipk/app/services/user_service.dart';
import 'package:sipk/models/users_model.dart';

class AdminManageUserController extends GetxController {
  final UserService userService = UserService();
  final PagingController<int, UsersModel> pagingController =
      PagingController(firstPageKey: 0);

  final searchQuery = ''.obs;
  final isLoading = false.obs;
  final hasMoreData = true.obs;
  final int pageSize = 10;

  final isSelectionMode = false.obs;
  final selectedUsers = <String, bool>{}.obs;

  final selectedRoles = <String, bool>{
    'Account Officer': false,
    'Supervisor': false,
    'Manajer': false,
  }.obs;

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
      fetchUsers(pageKey);
    });
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }

  void applyFilters() {
    pagingController.refresh();
    Get.back();
  }

  Future<void> fetchUsers(int pageKey) async {
    if (isLoading.value) return;
    isLoading(true);

    try {
      final int from = pageKey * pageSize;
      final int to = from + pageSize - 1;
      final selectedRolesList = selectedRoles.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key)
          .toList();

      List<UsersModel> fetchedUsers;

      if (selectedRolesList.isNotEmpty) {
        fetchedUsers = await userService.fetchUsersWithRole(
          selectedRolesList: selectedRolesList,
          searchQuery: searchQuery.value,
          from: from,
          to: to,
        );
      } else {
        fetchedUsers = await userService.fetchUsers(
          searchQuery: searchQuery.value,
          from: from,
          to: to,
        );
      }

      for (var user in fetchedUsers) {
        if (!selectedUsers.containsKey(user.id)) {
          selectedUsers[user.id!] = false;
        }
      }

      final isLastPage = fetchedUsers.length < pageSize;

      if (isLastPage) {
        pagingController.appendLastPage(fetchedUsers);
      } else {
        pagingController.appendPage(fetchedUsers, pageKey + 1);
      }
    } catch (e) {
      pagingController.error = e;
    } finally {
      isLoading(false);
    }
  }

  void resetFilters() => selectedRoles.updateAll((key, value) => false);

  void toggleRole(String role) {
    selectedRoles[role] = !(selectedRoles[role] ?? false);
  }

  void updateSearchQuery(String text) {
    searchQuery.value = text;
  }

  void toggleSelectionMode() {
    isSelectionMode.toggle();
    if (!isSelectionMode.value) {
      selectedUsers.updateAll((key, value) => false);
    }
  }

  void toggleSelection(String userId) {
    if (selectedUsers.containsKey(userId)) {
      selectedUsers[userId] = !selectedUsers[userId]!;
    } else {
      selectedUsers[userId] = true;
    }
  }

  void selectAll() {
    bool allSelected = selectedUsers.values.every((selected) => selected);
    selectedUsers.updateAll((key, value) => !allSelected);
  }

  int get selectedCount =>
      selectedUsers.values.where((selected) => selected).length;

  List<String> get selectedUserIds => selectedUsers.entries
      .where((entry) => entry.value)
      .map((entry) => entry.key)
      .toList();

  Future<void> deleteSelectedUsers() async {
    try {
      isLoading(true);

      List<String> usersToDelete = selectedUserIds;

      if (usersToDelete.isEmpty) return;

      await userService.deleteUsers(usersToDelete);
      isLoading(false);
      pagingController.refresh();
      isSelectionMode(false);
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text('Gagal menghapus pengguna: ${e.toString()}'),
          duration: const Duration(seconds: 2),
        ),
      );
    } finally {
      isLoading(false);
    }
  }
}
