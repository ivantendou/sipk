import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/admin_manage_user/controllers/admin_manage_user_controller.dart';
import 'package:sipk/app/modules/admin_user_detail/controllers/admin_user_detail_controller.dart';
import 'package:sipk/app/services/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminUserEditController extends GetxController {
  final UserService userService = UserService();
  final AdminManageUserController adminManageUserController =
      Get.find<AdminManageUserController>();
  final AdminUserDetailController adminUserDetailController =
      Get.find<AdminUserDetailController>();
  var userId = ''.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  var selectedRole = "".obs;
  var selectedServiceBranch = "".obs;
  final formKeys = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  final supabase = Supabase.instance.client;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;
    if (args != null) {
      userId.value = args['userId'] ?? '';
      nameController.text = args['fullName'] ?? '';
      emailController.text = args['email'] ?? '';
      passwordController.text = args['password'] ?? '';
      phoneNumberController.text = args['phoneNumber'] ?? '';
      selectedRole.value = args['role'] ?? '';
      selectedServiceBranch.value = args['serviceBranch'] ?? '';
    }
  }

  void updateUser() async {
    try {
      if (formKeys.currentState!.validate()) {
        isLoading(true);
        await userService.updateUser(
          userId: userId.value,
          name: nameController.text,
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          phoneNumber: phoneNumberController.text.trim(),
          role: selectedRole.value,
          serviceBranch: selectedServiceBranch.value,
        );

        adminManageUserController.pagingController.refresh();
        adminUserDetailController.fetchUser();
        showUserUpdatedDialog();
      }
    } catch (e) {
      if (e is SocketException) {
        showUpdateUserFailedDialog(
          'Koneksi internet bermasalah. Periksa jaringan Anda.',
        );
      } else {
        showUpdateUserFailedDialog("Email sudah digunakan oleh akun lain.");
      }
    } finally {
      isLoading(false);
    }
  }

  void setRole(String? value) {
    selectedRole.value = value ?? "";
  }

  void setServiceBranch(String? value) {
    selectedServiceBranch.value = value ?? "";
  }

  void showUserUpdatedDialog() {
    Get.defaultDialog(
      backgroundColor: ColorsConstant.white,
      contentPadding: const EdgeInsets.only(bottom: 24),
      title: 'Perubahan Data Berhasil',
      titleStyle: TextStyleConstant.subHeading.copyWith(
        fontWeight: FontWeight.bold,
      ),
      titlePadding: const EdgeInsets.only(top: 24, bottom: 16),
      onWillPop: () async {
        Get.back();
        return true;
      },
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Assets.images.success.svg(
              width: 80,
              colorFilter: const ColorFilter.mode(
                Colors.green,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Data pengguna telah berhasil diperbarui.',
              style: TextStyleConstant.body,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      confirm: InkWell(
        onTap: () {
        Get.back();
        },
        child: Ink(
          width: 180,
          height: 49,
          decoration: const BoxDecoration(
            color: ColorsConstant.primary,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Center(
            child: Text(
              'OK',
              style: TextStyleConstant.subHeading2.copyWith(
                color: ColorsConstant.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showUpdateUserFailedDialog(String errorMessage) {
    Get.defaultDialog(
      backgroundColor: ColorsConstant.white,
      contentPadding: const EdgeInsets.only(bottom: 24),
      title: 'Gagal Memperbarui Pengguna',
      titleStyle: TextStyleConstant.subHeading.copyWith(
        fontWeight: FontWeight.bold,
      ),
      titlePadding:
          const EdgeInsets.only(top: 24, bottom: 4, right: 16, left: 16),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          errorMessage,
          style: TextStyleConstant.body,
        ),
      ),
      confirm: InkWell(
        onTap: () {
          Get.back();
        },
        child: Ink(
          width: 180,
          height: 49,
          decoration: const BoxDecoration(
            color: ColorsConstant.primary,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Center(
            child: Text(
              'OK',
              style: TextStyleConstant.subHeading2.copyWith(
                color: ColorsConstant.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
