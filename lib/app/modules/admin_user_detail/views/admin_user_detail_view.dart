import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/admin_user_detail/controllers/admin_user_detail_controller.dart';
import 'package:sipk/app/modules/profile/views/widgets/profile_data_card_widget.dart';
import 'package:sipk/app/routes/app_pages.dart';
import 'package:sipk/app/widgets/custom_app_bar_widget.dart';
import 'package:sipk/app/widgets/custom_button_widget.dart';
import 'package:sipk/app/widgets/user_avatar_widget.dart';

class AdminUserDetailView extends GetView<AdminUserDetailController> {
  const AdminUserDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: 'Detail Pengguna'),
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
                const SizedBox(height: 32),
                CustomButtonWidget(
                  text: 'Edit',
                  width: 148,
                  onTap: () {
                    Get.toNamed(
                      Routes.ADMIN_USER_EDIT,
                      arguments: {
                        'userId': controller.user.value.id,
                        'fullName': controller.user.value.fullName,
                        'email': controller.user.value.email,
                        'password': controller.user.value.password,
                        'phoneNumber': controller.user.value.phoneNumber,
                        'role': controller.user.value.role,
                        'serviceBranch': controller.user.value.serviceBranch,
                      },
                    );
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
