import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/routes/app_pages.dart';
import 'package:sipk/app/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  final AuthService authService = AuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKeys = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = false.obs;

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
        final AuthResponse res = await authService.signInWithPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        if (res.user != null) {
          final user = res.user!;
          final role = user.userMetadata?['role'];
          final userId = user.id;
          final username = user.userMetadata?['full_name'];

          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('userId', userId);
          await prefs.setString('role', role);
          await prefs.setString('username', username);
          await prefs.setInt(
              'loginTimestamp', DateTime.now().millisecondsSinceEpoch);

          if (role == 'Admin') {
            Get.offAllNamed(Routes.BOTTOM_NAV_ADMIN);
          } else if (role == 'Manajer') {
            Get.offAllNamed(Routes.BOTTOM_NAV_MANAGER);
          } else {
            Get.offAllNamed(Routes.BOTTOM_NAV_AO);
          }
        }
      } catch (e) {
        if (e is AuthException && e.statusCode == '400') {
          showLoginFailedDialog("Email atau password salah.");
        } else if (e is SocketException) {
          showLoginFailedDialog(
              "Koneksi internet bermasalah. Periksa jaringan Anda.");
        } else {
          showLoginFailedDialog(
              "Terjadi kesalahan. Periksa jaringan Anda dan coba lagi.");
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
