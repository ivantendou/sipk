import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/routes/app_pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKeys = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = false.obs;

  final supabase = Supabase.instance.client;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Format email tidak valid';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (value.length < 8) {
      return 'Password minimal 8 karakter';
    }
    return null;
  }

  Future<void> login() async {
    if (formKeys.currentState!.validate()) {
      try {
        isLoading(true);
        final AuthResponse res = await supabase.auth.signInWithPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        if (res.user != null) {
          final user = res.user!;
          final role = user.userMetadata?['role'];
          if (role == 'admin') {
            Get.offAllNamed(Routes.ADMIN_MANAGE_DATA);
          } else if (role == 'manager') {
            Get.offAllNamed(Routes.MANAGER_SUBMISSION);
          } else {
            Get.offAllNamed(Routes.AO_HOME);
          }
        }
      } catch (e) {
        if (e is AuthException && e.statusCode == '400') {
          showLoginFailedDialog("Email atau password salah.");
        } else if (e is SocketException) {
          showLoginFailedDialog(
              "Koneksi internet bermasalah. Periksa jaringan Anda.");
        } else {
          showLoginFailedDialog("Terjadi kesalahan. Coba lagi nanti.");
        }
      } finally {
        isLoading(false);
      }
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void showLoginFailedDialog(String errorMessage) {
    Get.defaultDialog(
      backgroundColor: ColorsConstant.white,
      contentPadding: const EdgeInsets.only(bottom: 24),
      title: 'Login Gagal',
      titleStyle: TextStyleConstant.subHeading.copyWith(
        fontWeight: FontWeight.bold,
      ),
      titlePadding: const EdgeInsets.only(top: 24, bottom: 4),
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
}
