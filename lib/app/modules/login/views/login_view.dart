import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/fonts.gen.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/widgets/auth_text_field_widget.dart';
import 'package:sipk/app/widgets/form_button_widget.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstant.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Assets.images.logo.svg(
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Sistem Informasi Penilaian Kredit',
                      style: TextStyle(
                        fontFamily: FontFamily.koblenzSerial,
                        fontSize: 16,
                        height: 1.25,
                        color: Color(0xFF26327E),
                      ),
                    ),
                    const SizedBox(height: 60),
                    Form(
                      key: controller.formKeys,
                      child: Column(
                        children: [
                          AuthTextFieldWidget(
                            controller: controller.emailController,
                            hintText: 'Masukkan email Anda',
                            prefixIcon: Assets.images.email.svg(),
                            validator: controller.validateEmail,
                            obscureText: false,
                          ),
                          const SizedBox(height: 20),
                          Obx(
                            () => AuthTextFieldWidget(
                              controller: controller.passwordController,
                              hintText: 'Masukkan kata sandi Anda',
                              obscureText: !controller.isPasswordVisible.value,
                              prefixIcon: Assets.images.password.svg(),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.togglePasswordVisibility();
                                },
                                child: controller.isPasswordVisible.value
                                    ? Assets.images.eye.svg()
                                    : Assets.images.eyeOff.svg(),
                              ),
                              validator: controller.validatePassword,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Obx(
                      () => FormButtonWidget(
                        isLoading: controller.isLoading.value,
                        text: "Login",
                        width: 180,
                        onTap: () {
                          controller.login();
                        },
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Lupa Password?',
                        style: TextStyleConstant.caption.copyWith(
                          color: ColorsConstant.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
