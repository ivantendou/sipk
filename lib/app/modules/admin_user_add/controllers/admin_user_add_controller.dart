import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/admin_manage_user/controllers/admin_manage_user_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminUserAddController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final AdminManageUserController adminManageUserController =
      Get.find<AdminManageUserController>();
  var selectedRole = "".obs;
  var selectedServiceBranch = "".obs;
  final formKeys = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  final supabase = Supabase.instance.client;

  void setRole(String? value) {
    selectedRole.value = value ?? "";
  }

  void setServiceBranch(String? value) {
    selectedServiceBranch.value = value ?? "";
  }

  void addUser() async {
    try {
      if (formKeys.currentState!.validate()) {
        isLoading(true);
        await supabase.auth.signUp(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          data: {
            'full_name': nameController.text,
            'phone_number': phoneNumberController.text,
            'role': selectedRole.toString(),
            'service_branch': selectedServiceBranch.toString(),
            'email': emailController.text,
            'password': passwordController.text,
          },
        );

        Get.back();
        clearForm();
        adminManageUserController.pagingController.refresh();
        showUserCreatedDialog();
      }
    } catch (e) {
      if (e is AuthException) {
        showAddUserFailedDialog(e.message);
      } else {
        showAddUserFailedDialog("Terjadi kesalahan. Coba lagi nanti.");
      }
    } finally {
      isLoading(false);
    }
  }

  void showUserCreatedDialog() {
    Get.defaultDialog(
      backgroundColor: ColorsConstant.white,
      contentPadding: const EdgeInsets.only(bottom: 24),
      title: 'Pengguna Baru Ditambahkan',
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
              'Pengguna berhasil ditambahkan ke sistem',
              style: TextStyleConstant.body,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      confirm: InkWell(
        onTap: () => Get.back(),
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

  void showAddUserFailedDialog(String errorMessage) {
    Get.defaultDialog(
      backgroundColor: ColorsConstant.white,
      contentPadding: const EdgeInsets.only(bottom: 24),
      title: 'Gagal Menambahkan Pengguna',
      titleStyle: TextStyleConstant.subHeading.copyWith(
        fontWeight: FontWeight.bold,
      ),
      titlePadding:
          const EdgeInsets.only(top: 24, bottom: 4, right: 16, left: 16),
      content: Text(
        errorMessage,
        style: TextStyleConstant.body,
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

  void clearForm() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    phoneNumberController.clear();
    selectedRole.value = "";
    selectedServiceBranch.value = "";
    formKeys.currentState?.reset();
  }
}
