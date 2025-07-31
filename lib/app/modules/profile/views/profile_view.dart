import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/profile/controllers/profile_controller.dart';
import 'package:sipk/app/modules/profile/views/widgets/logout_confirmation_dialog_widget.dart';
import 'package:sipk/app/modules/profile/views/widgets/profile_data_card_widget.dart';
import 'package:sipk/app/widgets/custom_button_widget.dart';
import 'package:sipk/app/widgets/user_avatar_widget.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConstant.grey100,
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              width: double.infinity,
              child: Obx(() {
                if (controller.isLoading.value) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: SizedBox(
                        width: 48,
                        child: LoadingIndicator(
                          indicatorType: Indicator.ballBeat,
                          strokeWidth: 4.0,
                          colors: [Theme.of(context).primaryColor],
                        ),
                      ),
                    ),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UserAvatarWidget(imageUrl: controller.user.value.avatarUrl),
                    const SizedBox(height: 16),
                    ProfileDataCardWidget(
                      name: controller.user.value.fullName ?? "-",
                      role: controller.user.value.role ?? "-",
                      telephoneNumber: controller.user.value.phoneNumber ?? "-",
                      email: controller.user.value.email ?? "-",
                    ),
                    const SizedBox(height: 16),
                    CustomButtonWidget(
                      text: 'Logout',
                      width: 120,
                      onTap: () {
                        showLogoutConfirmationDialog(controller);
                      },
                    ),
                  ],
                );
              })),
        ),
      ),
    );
  }
}
