import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/admin_manage_user/views/widgets/user_card_widget.dart';
import 'package:sipk/app/routes/app_pages.dart';
import 'package:sipk/app/widgets/custom_app_bar_widget.dart';
import 'package:sipk/app/widgets/custom_button_widget.dart';
import 'package:sipk/models/users_model.dart';

import '../controllers/admin_manage_user_controller.dart';

class AdminManageUserView extends GetView<AdminManageUserController> {
  const AdminManageUserView({super.key});

  void _showFilterBottomSheet(BuildContext context) {
    final ctrl = controller;

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Obx(
          () {
            return Wrap(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filter Pengguna',
                      style: TextStyleConstant.subHeading
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () => ctrl.resetFilters(),
                      child: Text(
                        'Reset',
                        style: TextStyleConstant.body.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorsConstant.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ListTile(
                  title: const Text('Account Officer'),
                  contentPadding: const EdgeInsets.all(0),
                  trailing: SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      value: ctrl.selectedRoles['Account Officer'] ?? false,
                      onChanged: (value) => ctrl.toggleRole('Account Officer'),
                      activeColor: ColorsConstant.primary,
                    ),
                  ),
                  onTap: () => ctrl.toggleRole('Account Officer'),
                ),
                ListTile(
                  title: const Text('Supervisor'),
                  contentPadding: const EdgeInsets.all(0),
                  trailing: SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      value: ctrl.selectedRoles['Supervisor'] ?? false,
                      onChanged: (value) => ctrl.toggleRole('Supervisor'),
                      activeColor: ColorsConstant.primary,
                    ),
                  ),
                  onTap: () => ctrl.toggleRole('Supervisor'),
                ),
                ListTile(
                  title: const Text('Manajer'),
                  contentPadding: const EdgeInsets.all(0),
                  trailing: SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      value: ctrl.selectedRoles['Manajer'] ?? false,
                      onChanged: (value) => ctrl.toggleRole('Manajer'),
                      activeColor: ColorsConstant.primary,
                    ),
                  ),
                  onTap: () => ctrl.toggleRole('Manajer'),
                ),
                CustomButtonWidget(
                  text: 'Terapkan',
                  width: double.infinity,
                  onTap: () => ctrl.applyFilters(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog() {
    Get.defaultDialog(
      title: 'Konfirmasi',
      middleText:
          'Anda yakin ingin menghapus ${controller.selectedCount} pengguna?',
      textCancel: 'Batal',
      textConfirm: 'Hapus',
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onCancel: () => Get.back(),
      onConfirm: () {
        Get.back();
        controller.deleteSelectedUsers();
      },
    );
  }

  AppBar _buildSelectionAppBar() {
    return AppBar(
      title: Text(
        '${controller.selectedCount} terpilih',
        style: TextStyleConstant.subHeading2,
      ),
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => controller.toggleSelectionMode(),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.select_all),
          onPressed: () => controller.selectAll(),
        ),
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            if (controller.selectedCount > 0) {
              _showDeleteConfirmationDialog();
            } else {
              Get.snackbar(
                'Info',
                'Pilih setidaknya satu pengguna untuk dihapus',
                backgroundColor: Colors.amber,
                colorText: Colors.black,
              );
            }
          },
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: ColorsConstant.grey500,
          height: 1.0,
        ),
      ),
    );
  }

  AppBarWithSearchSwitch _buildRegularAppBar(BuildContext context) {
    return AppBarWithSearchSwitch(
      titleTextStyle: TextStyleConstant.subHeading2,
      scrolledUnderElevation: 0.0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: ColorsConstant.grey500,
          height: 1.0,
        ),
      ),
      onChanged: (text) => controller.updateSearchQuery(text),
      onSubmitted: (text) => controller.applyFilters(),
      animation: AppBarAnimationSlideLeft.call,
      appBarBuilder: (context) {
        return CustomAppBarWidget(
          title: 'Kelola Pengguna',
          centerTitle: false,
          actions: [
            GestureDetector(
              onTap: () {
                AppBarWithSearchSwitch.of(context)?.startSearch();
              },
              child: Assets.images.search.svg(
                width: 24,
                colorFilter: const ColorFilter.mode(
                    ColorsConstant.black, BlendMode.srcIn),
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () => _showFilterBottomSheet(context),
              child: Assets.images.filter1.svg(
                width: 24,
                colorFilter: const ColorFilter.mode(
                    ColorsConstant.black, BlendMode.srcIn),
              ),
            ),
            const SizedBox(width: 16),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: controller.isSelectionMode.value
            ? _buildSelectionAppBar()
            : _buildRegularAppBar(context),
        backgroundColor: ColorsConstant.grey100,
        body: RefreshIndicator(
          color: ColorsConstant.primary,
          onRefresh: () async {
            controller.pagingController.refresh();
          },
          child: PagedListView<int, UsersModel>(
            pagingController: controller.pagingController,
            padding: const EdgeInsets.symmetric(vertical: 8),
            builderDelegate: PagedChildBuilderDelegate<UsersModel>(
              itemBuilder: (context, user, index) {
                return Obx(() {
                  final isSelected = controller.selectedUsers[user.id] ?? false;
                  return UserCardWidget(
                    name: user.fullName,
                    role: user.role,
                    userId: user.id!,
                    isSelected: isSelected,
                    isSelectionMode: controller.isSelectionMode.value,
                    onTap: controller.isSelectionMode.value
                        ? () => controller.toggleSelection(user.id!)
                        : () {
                            Get.toNamed(
                              Routes.ADMIN_USER_DETAIL,
                              arguments: {'userId': user.id},
                            );
                          },
                    onLongPress: () {
                      if (!controller.isSelectionMode.value) {
                        controller.toggleSelectionMode();
                        controller.toggleSelection(user.id!);
                      }
                    },
                    onCheckboxChanged: (value) {
                      controller.toggleSelection(user.id!);
                    },
                  );
                });
              },
              firstPageProgressIndicatorBuilder: (context) => Center(
                child: SizedBox(
                  width: 48,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballBeat,
                    strokeWidth: 4.0,
                    colors: [Theme.of(context).primaryColor],
                  ),
                ),
              ),
              newPageProgressIndicatorBuilder: (context) => Center(
                child: SizedBox(
                  width: 48,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballBeat,
                    strokeWidth: 4.0,
                    colors: [Theme.of(context).primaryColor],
                  ),
                ),
              ),
              noItemsFoundIndicatorBuilder: (context) => const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Tidak ada pengguna ditemukan',
                    style: TextStyleConstant.body,
                  ),
                ),
              ),
              noMoreItemsIndicatorBuilder: (context) => const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Tidak ada data lagi',
                    style: TextStyleConstant.caption,
                  ),
                ),
              ),
              firstPageErrorIndicatorBuilder: (context) => Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Assets.images.errorImage.svg(width: 240),
                    const SizedBox(height: 6),
                    const Text(
                      'Terjadi Kesalahan',
                      style: TextStyleConstant.subHeading2,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Pastikan perangkat Anda terhubung ke internet dan coba lagi.',
                      textAlign: TextAlign.center,
                      style: TextStyleConstant.body.copyWith(
                        color: ColorsConstant.grey700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: controller.isSelectionMode.value
            ? null
            : FloatingActionButton(
                onPressed: () {
                  Get.toNamed(Routes.ADMIN_USER_ADD);
                },
                backgroundColor: ColorsConstant.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Assets.images.plus.svg(),
              ),
      );
    });
  }
}
